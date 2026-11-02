import 'package:flutter/material.dart';

import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/candle.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/states.dart';
import 'candle_chart_painter.dart';
import 'chart_config.dart';

/// Reusable candlestick chart. Wraps the painter with hover tracking, an OHLC
/// readout and a graceful empty fallback. This is the single chart integration
/// surface for the app — swap the painter for TradingView interop here without
/// touching callers.
class CandleChart extends StatefulWidget {
  const CandleChart({
    super.key,
    required this.data,
    required this.config,
  });

  final ChartData data;
  final ChartOverlayConfig config;

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  int? _hoverIndex;

  @override
  Widget build(BuildContext context) {
    final candles = widget.data.candles;
    if (candles.isEmpty) {
      return const EmptyState(
        icon: Icons.show_chart,
        title: 'No chart data',
        message: 'Candle data is unavailable for this timeframe.',
      );
    }

    return LayoutBuilder(builder: (context, constraints) {
      final chartWidth = constraints.maxWidth - 56; // right axis
      return Stack(
        children: [
          MouseRegion(
            onHover: (event) {
              final slot = chartWidth / candles.length;
              final idx = (event.localPosition.dx / slot).floor();
              if (idx >= 0 && idx < candles.length && idx != _hoverIndex) {
                setState(() => _hoverIndex = idx);
              }
            },
            onExit: (_) => setState(() => _hoverIndex = null),
            child: CustomPaint(
              size: Size.infinite,
              painter: CandleChartPainter(
                data: widget.data,
                config: widget.config,
                hoverIndex: _hoverIndex,
                textScale: 1,
              ),
            ),
          ),
          Positioned(
            left: AppSpacing.sm,
            top: AppSpacing.sm,
            child: _OhlcReadout(
              candle: _hoverIndex != null ? candles[_hoverIndex!] : candles.last,
            ),
          ),
        ],
      );
    });
  }
}

class _OhlcReadout extends StatelessWidget {
  const _OhlcReadout({required this.candle});
  final Candle candle;

  @override
  Widget build(BuildContext context) {
    final color = candle.isBullish ? AppColors.bullish : AppColors.bearish;
    Widget item(String l, double v) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$l ', style: AppTypography.caption),
              Text(Formatters.price(v),
                  style: AppTypography.caption.copyWith(color: color)),
            ],
          ),
        );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.border),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          item('O', candle.open),
          item('H', candle.high),
          item('L', candle.low),
          item('C', candle.close),
          Text(Formatters.shortTime(candle.time), style: AppTypography.caption),
        ],
      ),
    );
  }
}
