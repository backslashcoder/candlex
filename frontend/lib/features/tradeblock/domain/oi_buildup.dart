import '../../../core/enums.dart';

/// Futures & Options open-interest build-up classification — the derivation
/// every F&O desk reads off a price-vs-OI grid. Pure domain (no Flutter).
///
/// Price ↑ + OI ↑ => fresh longs (Long Build-up)
/// Price ↓ + OI ↑ => fresh shorts (Short Build-up)
/// Price ↑ + OI ↓ => shorts exiting (Short Covering)
/// Price ↓ + OI ↓ => longs exiting (Long Unwinding)
enum OiBuildup { longBuildup, shortBuildup, shortCovering, longUnwinding, neutral }

extension OiBuildupX on OiBuildup {
  /// Classify from the signed price move and signed OI change.
  static OiBuildup classify(double priceChangePct, double oiChangePct) {
    const flat = 0.05; // treat near-zero moves as undecided
    if (priceChangePct.abs() < flat) return OiBuildup.neutral;
    final priceUp = priceChangePct > 0;
    final oiUp = oiChangePct > 0;
    if (priceUp && oiUp) return OiBuildup.longBuildup;
    if (!priceUp && oiUp) return OiBuildup.shortBuildup;
    if (priceUp && !oiUp) return OiBuildup.shortCovering;
    return OiBuildup.longUnwinding;
  }

  String get label => switch (this) {
        OiBuildup.longBuildup => 'Long Build-up',
        OiBuildup.shortBuildup => 'Short Build-up',
        OiBuildup.shortCovering => 'Short Covering',
        OiBuildup.longUnwinding => 'Long Unwinding',
        OiBuildup.neutral => 'Neutral',
      };

  String get shortLabel => switch (this) {
        OiBuildup.longBuildup => 'LONG BUILD-UP',
        OiBuildup.shortBuildup => 'SHORT BUILD-UP',
        OiBuildup.shortCovering => 'SHORT COVERING',
        OiBuildup.longUnwinding => 'LONG UNWINDING',
        OiBuildup.neutral => 'NEUTRAL',
      };

  /// One-line plain-English read of what the build-up implies.
  String get interpretation => switch (this) {
        OiBuildup.longBuildup =>
          'Price rising with rising OI — fresh long positions being added.',
        OiBuildup.shortBuildup =>
          'Price falling with rising OI — fresh short positions being added.',
        OiBuildup.shortCovering =>
          'Price rising with falling OI — shorts buying back to exit.',
        OiBuildup.longUnwinding =>
          'Price falling with falling OI — longs booking out of positions.',
        OiBuildup.neutral =>
          'No decisive price move — open interest signal is inconclusive.',
      };

  /// Directional bias the build-up leans toward.
  Direction get direction => switch (this) {
        OiBuildup.longBuildup => Direction.bullish,
        OiBuildup.shortCovering => Direction.bullish,
        OiBuildup.shortBuildup => Direction.bearish,
        OiBuildup.longUnwinding => Direction.bearish,
        OiBuildup.neutral => Direction.neutral,
      };

  bool get isBullish => direction == Direction.bullish;
  bool get isBearish => direction == Direction.bearish;

  /// Strong build-ups (fresh positioning) vs. unwinding/covering (exits).
  bool get isFreshPositioning =>
      this == OiBuildup.longBuildup || this == OiBuildup.shortBuildup;
}
