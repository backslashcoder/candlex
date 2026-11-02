import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Typography for the terminal. Inter for UI text, Roboto Mono for monospace;
/// both are loaded via a Google Fonts stylesheet in web/index.html, so we only
/// reference the family names here (no runtime font-fetch package needed).
/// Financial values use tabular figures so columns of numbers align.
class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'Inter';
  static const String monoFamily = 'Roboto Mono';
  static const List<String> _fallback = ['Inter', 'Roboto', 'Arial', 'sans-serif'];
  static const List<FontFeature> _tabular = [FontFeature.tabularFigures()];

  static TextTheme textTheme(TextTheme base) {
    return base
        .apply(
          fontFamily: fontFamily,
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        )
        .copyWith();
  }

  static TextStyle _t({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double? spacing,
    bool tabular = false,
    bool mono = false,
  }) {
    return TextStyle(
      fontFamily: mono ? monoFamily : fontFamily,
      fontFamilyFallback: _fallback,
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: spacing,
      fontFeatures: tabular ? _tabular : null,
    );
  }

  // UI styles ---------------------------------------------------------------
  static TextStyle get h1 =>
      _t(size: 20, weight: FontWeight.w600, spacing: -0.2);
  static TextStyle get h2 =>
      _t(size: 16, weight: FontWeight.w600, spacing: -0.1);
  static TextStyle get h3 => _t(size: 13, weight: FontWeight.w600);
  static TextStyle get label => _t(
      size: 11,
      weight: FontWeight.w600,
      color: AppColors.textSecondary,
      spacing: 0.4);
  static TextStyle get body => _t(size: 13);
  static TextStyle get bodySmall =>
      _t(size: 12, color: AppColors.textSecondary);
  static TextStyle get caption => _t(
      size: 10,
      weight: FontWeight.w500,
      color: AppColors.textTertiary,
      spacing: 0.3);

  // Numeric (tabular) styles ------------------------------------------------
  static TextStyle get numLarge =>
      _t(size: 18, weight: FontWeight.w600, tabular: true);
  static TextStyle get num =>
      _t(size: 13, weight: FontWeight.w500, tabular: true);
  static TextStyle get numSmall =>
      _t(size: 12, weight: FontWeight.w500, tabular: true);
  static TextStyle get mono =>
      _t(size: 12, weight: FontWeight.w500, tabular: true, mono: true);
}
