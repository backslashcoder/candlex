import 'package:flutter/material.dart';

import '../enums.dart';
import '../formatting/formatters.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Colored percentage text with an optional directional caret.
class PercentageChange extends StatelessWidget {
  const PercentageChange(
    this.value, {
    super.key,
    this.showCaret = true,
    this.style,
    this.pill = false,
  });

  final double value;
  final bool showCaret;
  final TextStyle? style;
  final bool pill;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forChange(value);
    final text = Formatters.percent(value);
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showCaret && value != 0)
          Icon(
            value > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            size: 16,
            color: color,
          ),
        Text(text, style: (style ?? AppTypography.numSmall).copyWith(color: color)),
      ],
    );
    if (!pill) return content;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.backgroundForChange(value),
        borderRadius: BorderRadius.circular(4),
      ),
      child: content,
    );
  }
}

/// Colored absolute-change text.
class ChangeText extends StatelessWidget {
  const ChangeText(this.value, {super.key, this.style});
  final double value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forChange(value);
    return Text(
      Formatters.change(value),
      style: (style ?? AppTypography.numSmall).copyWith(color: color),
    );
  }
}

/// Small colored pill for a [Direction].
class DirectionPill extends StatelessWidget {
  const DirectionPill(this.direction, {super.key, this.label});
  final Direction direction;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final color = switch (direction) {
      Direction.bullish => AppColors.bullish,
      Direction.bearish => AppColors.bearish,
      Direction.neutral => AppColors.textSecondary,
    };
    final bg = switch (direction) {
      Direction.bullish => AppColors.bullishBackground,
      Direction.bearish => AppColors.bearishBackground,
      Direction.neutral => AppColors.surfaceSecondary,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label ?? direction.label.toUpperCase(),
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
