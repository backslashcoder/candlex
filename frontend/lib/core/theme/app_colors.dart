import 'package:flutter/material.dart';

/// Centralized semantic color palette for the Market Intelligence Terminal.
///
/// Dark institutional trading-terminal identity. All surfaces, text and
/// semantic (bullish / bearish / accent / warning) colors live here so the
/// rest of the app never hardcodes a hex value.
class AppColors {
  const AppColors._();

  // Backgrounds / surfaces (dark, layered).
  static const Color background = Color(0xFF0B0E11);
  static const Color panel = Color(0xFF11161C);
  static const Color surfaceSecondary = Color(0xFF171D25);
  static const Color surfaceElevated = Color(0xFF1B222C);
  static const Color border = Color(0xFF27313D);
  static const Color borderSubtle = Color(0xFF1E262F);

  // Text.
  static const Color textPrimary = Color(0xFFE6EDF3);
  static const Color textSecondary = Color(0xFF8B98A7);
  static const Color textTertiary = Color(0xFF5C6773);

  // Bullish.
  static const Color bullish = Color(0xFF16C784);
  static const Color bullishBackground = Color(0xFF10291F);
  static const Color bullishMuted = Color(0xFF0E7A52);

  // Bearish.
  static const Color bearish = Color(0xFFEA3943);
  static const Color bearishBackground = Color(0xFF2B171B);
  static const Color bearishMuted = Color(0xFF9E2A31);

  // Accent / info.
  static const Color accent = Color(0xFF5794F7);
  static const Color accentBackground = Color(0xFF13233F);

  // Warning.
  static const Color warning = Color(0xFFE5A93B);
  static const Color warningBackground = Color(0xFF2E2514);

  // Neutral chart ink.
  static const Color neutral = Color(0xFF8B98A7);
  static const Color gridLine = Color(0xFF1C242E);

  /// Semantic color for a directional value.
  static Color forChange(double change) {
    if (change > 0) return bullish;
    if (change < 0) return bearish;
    return textSecondary;
  }

  static Color backgroundForChange(double change) {
    if (change > 0) return bullishBackground;
    if (change < 0) return bearishBackground;
    return surfaceSecondary;
  }
}
