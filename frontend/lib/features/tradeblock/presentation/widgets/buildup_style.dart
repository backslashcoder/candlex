import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/oi_buildup.dart';

/// Maps an [OiBuildup] to its terminal palette. Kept in the presentation layer
/// so the domain enum stays Flutter-free.
class BuildupStyle {
  const BuildupStyle._();

  static Color color(OiBuildup b) => switch (b) {
        OiBuildup.longBuildup => AppColors.bullish,
        OiBuildup.shortCovering => AppColors.bullishMuted,
        OiBuildup.shortBuildup => AppColors.bearish,
        OiBuildup.longUnwinding => AppColors.bearishMuted,
        OiBuildup.neutral => AppColors.textTertiary,
      };

  static Color background(OiBuildup b) => switch (b) {
        OiBuildup.longBuildup => AppColors.bullishBackground,
        OiBuildup.shortCovering => AppColors.bullishBackground,
        OiBuildup.shortBuildup => AppColors.bearishBackground,
        OiBuildup.longUnwinding => AppColors.bearishBackground,
        OiBuildup.neutral => AppColors.surfaceSecondary,
      };

  static IconData icon(OiBuildup b) => switch (b) {
        OiBuildup.longBuildup => Icons.trending_up,
        OiBuildup.shortCovering => Icons.u_turn_right,
        OiBuildup.shortBuildup => Icons.trending_down,
        OiBuildup.longUnwinding => Icons.u_turn_left,
        OiBuildup.neutral => Icons.remove,
      };
}
