import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// A compact horizontal meter (0–100) used for strength and liquidity scores.
class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
    required this.value,
    this.color,
    this.width = 54,
    this.showValue = true,
  });

  final double value;
  final Color? color;
  final double width;
  final bool showValue;

  @override
  Widget build(BuildContext context) {
    final c = color ?? _gradientColor(value);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.surfaceSecondary,
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: (value / 100).clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        if (showValue) ...[
          const SizedBox(width: 6),
          Text(value.toStringAsFixed(0),
              style: AppTypography.numSmall.copyWith(color: c)),
        ],
      ],
    );
  }

  static Color _gradientColor(double v) {
    if (v >= 70) return AppColors.bullish;
    if (v >= 45) return AppColors.accent;
    if (v >= 30) return AppColors.warning;
    return AppColors.bearish;
  }
}

/// Strength score specialization.
class StrengthIndicator extends StatelessWidget {
  const StrengthIndicator(this.value, {super.key, this.width = 54});
  final double value;
  final double width;
  @override
  Widget build(BuildContext context) => ScoreBar(value: value, width: width);
}

/// Liquidity score specialization (neutral accent coloring).
class LiquidityIndicator extends StatelessWidget {
  const LiquidityIndicator(this.value, {super.key, this.width = 54});
  final double value;
  final double width;
  @override
  Widget build(BuildContext context) =>
      ScoreBar(value: value, width: width, color: AppColors.accent);
}

/// Rank movement arrow (▲ up / ▼ down / — flat).
class RankMovementIndicator extends StatelessWidget {
  const RankMovementIndicator(this.movement, {super.key});
  final int movement;

  @override
  Widget build(BuildContext context) {
    if (movement == 0) {
      return Text('—', style: AppTypography.caption);
    }
    final up = movement > 0;
    final color = up ? AppColors.bullish : AppColors.bearish;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(up ? Icons.arrow_upward : Icons.arrow_downward,
            size: 11, color: color),
        const SizedBox(width: 1),
        Text('${movement.abs()}',
            style: AppTypography.caption.copyWith(color: color)),
      ],
    );
  }
}
