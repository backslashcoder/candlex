import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/models/candle.dart';
import '../../../../core/theme/app_colors.dart';
import 'chart_config.dart';

/// Paints the candlestick chart, overlays and axes. Pure rendering — all data
/// and layout decisions come in via [ChartData]/[ChartOverlayConfig].
class CandleChartPainter extends CustomPainter {
  CandleChartPainter({
    required this.data,
    required this.config,
    required this.hoverIndex,
    required this.textScale,
  });

  final ChartData data;
  final ChartOverlayConfig config;
  final int? hoverIndex;
  final double textScale;

  static const double _rightAxisWidth = 56;
  static const double _bottomAxisHeight = 18;

  @override
  void paint(Canvas canvas, Size size) {
    final candles = data.candles;
    if (candles.isEmpty) return;

    final chartWidth = size.width - _rightAxisWidth;
    final volumeHeight = config.showVolume ? size.height * 0.18 : 0.0;
    final priceHeight = size.height - volumeHeight - _bottomAxisHeight;

    // Price range from candles + visible overlays.
    double maxP = candles.first.high;
    double minP = candles.first.low;
    for (final c in candles) {
      if (c.high > maxP) maxP = c.high;
      if (c.low < minP) minP = c.low;
    }
    void expand(double? v) {
      if (v == null) return;
      if (v > maxP) maxP = v;
      if (v < minP) minP = v;
    }

    final analysis = data.analysis;
    if (analysis != null) {
      if (config.showLiquidity) {
        for (final l in analysis.liquidityLevels) {
          expand(l.price);
        }
      }
      if (config.showOrderBlocks) {
        for (final o in analysis.orderBlocks) {
          expand(o.top);
          expand(o.bottom);
        }
      }
    }
    final pad = (maxP - minP) * 0.06;
    maxP += pad;
    minP -= pad;
    final range = (maxP - minP).clamp(0.0001, double.infinity);

    double yForPrice(double p) => (maxP - p) / range * priceHeight;
    final slot = chartWidth / candles.length;
    final bodyWidth = (slot * 0.62).clamp(1.0, 14.0);

    _drawGrid(canvas, size, chartWidth, priceHeight, minP, maxP, yForPrice);

    // Order block zones.
    if (config.showOrderBlocks && analysis != null) {
      for (final ob in analysis.orderBlocks) {
        final color = ob.kind == OrderBlockKind.bullish
            ? AppColors.bullish
            : AppColors.bearish;
        final rect = Rect.fromLTRB(
          0,
          yForPrice(ob.top),
          chartWidth,
          yForPrice(ob.bottom),
        );
        canvas.drawRect(
          rect,
          Paint()..color = color.withValues(alpha: ob.active ? 0.12 : 0.05),
        );
        canvas.drawRect(
          rect,
          Paint()
            ..color = color.withValues(alpha: 0.4)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 0.6,
        );
        _drawTag(canvas, ob.label, 2, rect.top + 1, color);
      }
    }

    // Liquidity / S-R levels.
    if (config.showLiquidity && analysis != null) {
      for (final lvl in analysis.liquidityLevels) {
        final y = yForPrice(lvl.price);
        if (y < 0 || y > priceHeight) continue;
        final color = lvl.label == 'VWAP'
            ? AppColors.accent
            : lvl.isResistance
                ? AppColors.bearish
                : AppColors.textSecondary;
        _drawDashedLine(canvas, Offset(0, y), Offset(chartWidth, y), color);
      }
    }

    // Candles.
    for (int i = 0; i < candles.length; i++) {
      final c = candles[i];
      final x = slot * i + slot / 2;
      final color = c.isBullish ? AppColors.bullish : AppColors.bearish;
      final wickPaint = Paint()
        ..color = color
        ..strokeWidth = 1;
      canvas.drawLine(
          Offset(x, yForPrice(c.high)), Offset(x, yForPrice(c.low)), wickPaint);
      final top = yForPrice(c.isBullish ? c.close : c.open);
      final bottom = yForPrice(c.isBullish ? c.open : c.close);
      final rect = Rect.fromLTRB(
          x - bodyWidth / 2, top, x + bodyWidth / 2, bottom == top ? top + 1 : bottom);
      canvas.drawRect(rect, Paint()..color = color);
    }

    // Overlay lines (VWAP / EMA).
    if (config.showVwap) {
      _drawLine(canvas, candles, (c) => c.vwap, slot, yForPrice, AppColors.accent, 1.4);
    }
    if (config.showEma9) {
      _drawLine(canvas, candles, (c) => c.ema9, slot, yForPrice, AppColors.warning, 1.1);
    }
    if (config.showEma21) {
      _drawLine(
          canvas, candles, (c) => c.ema21, slot, yForPrice, const Color(0xFFB07BE8), 1.1);
    }

    // Volume histogram.
    if (config.showVolume) {
      double maxV = 0;
      for (final c in candles) {
        if (c.volume > maxV) maxV = c.volume;
      }
      final volTop = priceHeight + _bottomAxisHeight;
      for (int i = 0; i < candles.length; i++) {
        final c = candles[i];
        final x = slot * i + slot / 2;
        final h = maxV == 0 ? 0.0 : c.volume / maxV * (volumeHeight - 2);
        final color = (c.isBullish ? AppColors.bullish : AppColors.bearish)
            .withValues(alpha: 0.5);
        canvas.drawRect(
          Rect.fromLTWH(x - bodyWidth / 2, volTop + volumeHeight - h, bodyWidth, h),
          Paint()..color = color,
        );
      }
    }

    _drawPriceAxis(canvas, size, chartWidth, minP, maxP, yForPrice, candles.last.close);
    _drawCrosshair(canvas, size, candles, slot, chartWidth, priceHeight, yForPrice);
  }

  void _drawGrid(Canvas canvas, Size size, double chartWidth, double priceHeight,
      double minP, double maxP, double Function(double) yForPrice) {
    final paint = Paint()
      ..color = AppColors.gridLine
      ..strokeWidth = 0.5;
    const steps = 5;
    for (int i = 0; i <= steps; i++) {
      final p = minP + (maxP - minP) * i / steps;
      final y = yForPrice(p);
      canvas.drawLine(Offset(0, y), Offset(chartWidth, y), paint);
    }
  }

  void _drawLine(
    Canvas canvas,
    List<Candle> candles,
    double? Function(Candle) selector,
    double slot,
    double Function(double) yForPrice,
    Color color,
    double width,
  ) {
    final path = Path();
    bool started = false;
    for (int i = 0; i < candles.length; i++) {
      final v = selector(candles[i]);
      if (v == null) continue;
      final x = slot * i + slot / 2;
      final y = yForPrice(v);
      if (!started) {
        path.moveTo(x, y);
        started = true;
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = width
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Color color) {
    const dash = 4.0;
    const gap = 3.0;
    final paint = Paint()
      ..color = color.withValues(alpha: 0.6)
      ..strokeWidth = 0.8;
    double x = start.dx;
    while (x < end.dx) {
      canvas.drawLine(Offset(x, start.dy), Offset(x + dash, start.dy), paint);
      x += dash + gap;
    }
  }

  void _drawPriceAxis(Canvas canvas, Size size, double chartWidth, double minP,
      double maxP, double Function(double) yForPrice, double lastClose) {
    const steps = 5;
    for (int i = 0; i <= steps; i++) {
      final p = minP + (maxP - minP) * i / steps;
      final y = yForPrice(p);
      _drawText(canvas, p.toStringAsFixed(1), Offset(chartWidth + 4, y - 6),
          AppColors.textSecondary, 9);
    }
    // Last price marker.
    final y = yForPrice(lastClose);
    canvas.drawRect(
      Rect.fromLTWH(chartWidth, y - 8, _rightAxisWidth, 16),
      Paint()..color = AppColors.accent,
    );
    _drawText(canvas, lastClose.toStringAsFixed(1), Offset(chartWidth + 4, y - 6),
        Colors.white, 9, bold: true);
  }

  void _drawCrosshair(
    Canvas canvas,
    Size size,
    List<Candle> candles,
    double slot,
    double chartWidth,
    double priceHeight,
    double Function(double) yForPrice,
  ) {
    if (hoverIndex == null || hoverIndex! < 0 || hoverIndex! >= candles.length) {
      return;
    }
    final c = candles[hoverIndex!];
    final x = slot * hoverIndex! + slot / 2;
    final paint = Paint()
      ..color = AppColors.textSecondary.withValues(alpha: 0.5)
      ..strokeWidth = 0.6;
    canvas.drawLine(Offset(x, 0), Offset(x, priceHeight), paint);
    final y = yForPrice(c.close);
    canvas.drawLine(Offset(0, y), Offset(chartWidth, y), paint);
  }

  void _drawTag(Canvas canvas, String text, double x, double y, Color color) {
    _drawText(canvas, text, Offset(x + 3, y + 1), color, 8, bold: true);
  }

  void _drawText(Canvas canvas, String text, Offset offset, Color color, double size,
      {bool bold = false}) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size * textScale,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CandleChartPainter old) {
    return old.data != data ||
        old.config != config ||
        old.hoverIndex != hoverIndex;
  }
}
