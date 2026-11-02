/// Spacing, radius and sizing tokens. Kept compact to match the dense
/// information architecture of a professional trading terminal.
class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  // Radii — restrained, no excessively rounded cards.
  static const double radiusSm = 4;
  static const double radiusMd = 6;
  static const double radiusLg = 8;

  // Shell dimensions.
  static const double sidebarExpandedWidth = 224;
  static const double sidebarCollapsedWidth = 60;
  static const double topBarHeight = 56;
  static const double tickerHeight = 40;

  // Responsive breakpoints.
  static const double mobileBreakpoint = 640;
  static const double tabletBreakpoint = 1024;
  static const double laptopBreakpoint = 1280;
  static const double desktopBreakpoint = 1440;
}
