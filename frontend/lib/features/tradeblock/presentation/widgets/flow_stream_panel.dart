import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/trade_block_board.dart';
import '../../domain/trade_block_entry.dart';

/// The left "flow" zone: every instrument rendered as a stream that fans out on
/// the left and converges toward a central pivot — bullish streams in the upper
/// band, bearish in the lower. The selected symbol's stream is lit up.
class FlowStreamPanel extends StatelessWidget {
  const FlowStreamPanel({
    super.key,
    required this.board,
    required this.selectedSymbol,
  });

  final TradeBlockBoard board;
  final String? selectedSymbol;

  @override
  Widget build(BuildContext context) {
    final bull = board.bullish;
    final bear = board.bearish;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(bull.length, bear.length),
          Expanded(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: _FlowPainter(
                  bullish: bull,
                  bearish: bear,
                  selectedSymbol: selectedSymbol,
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(int bull, int bear) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_tree_outlined,
              size: 15, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text('Order Flow', style: AppTypography.h3)),
          _legendDot(AppColors.bullish, '$bull'),
          const SizedBox(width: AppSpacing.sm),
          _legendDot(AppColors.bearish, '$bear'),
        ],
      ),
    );
  }

  Widget _legendDot(Color c, String n) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(c == AppColors.bullish ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            size: 16, color: c),
        Text(n,
            style: AppTypography.numSmall.copyWith(color: c, fontSize: 11)),
      ],
    );
  }
}

class _FlowPainter extends CustomPainter {
  _FlowPainter({
    required this.bullish,
    required this.bearish,
    required this.selectedSymbol,
  });

  final List<TradeBlockEntry> bullish;
  final List<TradeBlockEntry> bearish;
  final String? selectedSymbol;

  static const int _maxPerSide = 46;

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height / 2;
    final pivotX = size.width * 0.9;

    // Subtle pivot "throat" guide.
    canvas.drawLine(
      Offset(size.width * 0.5, 8),
      Offset(size.width * 0.5, size.height - 8),
      Paint()
        ..color = AppColors.gridLine
        ..strokeWidth = 0.5,
    );

    TradeBlockEntry? selected;

    void drawSide(List<TradeBlockEntry> list, bool isBull, Color base) {
      final n = list.length.clamp(0, _maxPerSide);
      if (n == 0) return;
      final bandTop = isBull ? 6.0 : midY + 6;
      final bandBottom = isBull ? midY - 6 : size.height - 6;
      final pivotY = isBull ? midY - 4 : midY + 4;
      for (int i = 0; i < n; i++) {
        final e = list[i];
        if (e.symbol == selectedSymbol) {
          selected = e;
          continue; // draw on top later
        }
        final t = n == 1 ? 0.5 : i / (n - 1);
        final yStart = bandTop + t * (bandBottom - bandTop);
        _drawStream(canvas, size, yStart, pivotX, pivotY, e, base, false);
      }
    }

    drawSide(bullish, true, AppColors.bullish);
    drawSide(bearish, false, AppColors.bearish);

    // Pivot node.
    canvas.drawCircle(
      Offset(pivotX, midY),
      3,
      Paint()..color = AppColors.textSecondary,
    );
    canvas.drawCircle(
      Offset(pivotX, midY),
      6,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = AppColors.border,
    );

    // Highlighted (selected) stream drawn last, on top.
    final sel = selected;
    if (sel != null) {
      final isBull = sel.direction == Direction.bullish;
      final list = isBull ? bullish : bearish;
      final idx = list.indexWhere((e) => e.symbol == sel.symbol);
      final n = list.length.clamp(0, _maxPerSide);
      final bandTop = isBull ? 6.0 : midY + 6;
      final bandBottom = isBull ? midY - 6 : size.height - 6;
      final pivotY = isBull ? midY - 4 : midY + 4;
      final safeIdx = idx < 0 ? 0 : idx.clamp(0, n - 1);
      final t = n <= 1 ? 0.5 : safeIdx / (n - 1);
      final yStart = bandTop + t * (bandBottom - bandTop);
      _drawStream(canvas, size, yStart, pivotX, pivotY,
          sel, isBull ? AppColors.bullish : AppColors.bearish, true);
    }
  }

  void _drawStream(
    Canvas canvas,
    Size size,
    double yStart,
    double pivotX,
    double pivotY,
    TradeBlockEntry e,
    Color base,
    bool highlighted,
  ) {
    // Organic mid-curve wobble seeded per symbol (stable across ticks).
    final wobble = (e.flowSeed - 0.5) * size.height * 0.16;
    final path = Path()
      ..moveTo(0, yStart)
      ..cubicTo(
        size.width * 0.33, yStart + wobble,
        size.width * 0.62, pivotY + wobble * 0.3,
        pivotX, pivotY,
      );

    final strengthAlpha = highlighted
        ? 0.95
        : (0.10 + (e.strengthScore / 100) * 0.42).clamp(0.08, 0.55);

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = highlighted ? 2.2 : 1.0
        ..strokeCap = StrokeCap.round
        ..color = base.withValues(alpha: strengthAlpha.toDouble()),
    );

    if (highlighted) {
      canvas.drawCircle(Offset(0, yStart), 3, Paint()..color = base);
    }
  }

  @override
  bool shouldRepaint(covariant _FlowPainter old) =>
      old.selectedSymbol != selectedSymbol ||
      old.bullish != bullish ||
      old.bearish != bearish;
}
