import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// A split horizontal bar visualizing two opposing magnitudes
/// (advances vs declines, bullish vs bearish, etc.).
class BreadthBar extends StatelessWidget {
  const BreadthBar({
    super.key,
    required this.positive,
    required this.negative,
    this.neutral = 0,
    this.height = 8,
    this.showLabels = true,
    this.positiveLabel = 'Advances',
    this.negativeLabel = 'Declines',
  });

  final num positive;
  final num negative;
  final num neutral;
  final double height;
  final bool showLabels;
  final String positiveLabel;
  final String negativeLabel;

  @override
  Widget build(BuildContext context) {
    final total = (positive + negative + neutral).toDouble();
    final p = total == 0 ? 0.0 : positive / total;
    final n = total == 0 ? 0.0 : negative / total;
    final u = total == 0 ? 0.0 : neutral / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showLabels)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                _label(positiveLabel, positive.toInt(), AppColors.bullish),
                const Spacer(),
                if (neutral > 0)
                  _label('Unch', neutral.toInt(), AppColors.textSecondary),
                if (neutral > 0) const SizedBox(width: 12),
                _label(negativeLabel, negative.toInt(), AppColors.bearish),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: SizedBox(
            height: height,
            child: Row(
              children: [
                Expanded(
                  flex: (p * 1000).round().clamp(0, 1000),
                  child: Container(color: AppColors.bullish),
                ),
                if (u > 0)
                  Expanded(
                    flex: (u * 1000).round().clamp(0, 1000),
                    child: Container(color: AppColors.textTertiary),
                  ),
                Expanded(
                  flex: (n * 1000).round().clamp(1, 1000),
                  child: Container(color: AppColors.bearish),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _label(String text, int value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 7, height: 7, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Text('$text ', style: AppTypography.caption),
        Text('$value',
            style: AppTypography.numSmall.copyWith(color: color, fontSize: 11)),
      ],
    );
  }
}
