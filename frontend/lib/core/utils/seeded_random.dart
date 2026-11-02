/// A small deterministic PRNG (mulberry32) so mock data is stable across
/// rebuilds for a given seed — prices don't jump randomly on every refresh.
class SeededRandom {
  SeededRandom(int seed) : _state = seed & 0xFFFFFFFF;

  int _state;

  double next() {
    _state = (_state + 0x6D2B79F5) & 0xFFFFFFFF;
    int t = _state;
    t = (t ^ (t >> 15)) * (t | 1) & 0xFFFFFFFF;
    t ^= t + ((t ^ (t >> 7)) * (t | 61) & 0xFFFFFFFF) & 0xFFFFFFFF;
    t &= 0xFFFFFFFF;
    return ((t ^ (t >> 14)) & 0xFFFFFFFF) / 4294967296.0;
  }

  /// Uniform double in [min, max).
  double range(double min, double max) => min + next() * (max - min);

  /// Integer in [min, max].
  int intRange(int min, int max) => min + (next() * (max - min + 1)).floor();

  /// Centered noise in [-magnitude, magnitude].
  double noise(double magnitude) => (next() * 2 - 1) * magnitude;

  bool chance(double p) => next() < p;
}

/// Stable 32-bit hash for seeding from a string (symbol/timeframe key).
int stableHash(String input) {
  int hash = 2166136261;
  for (final codeUnit in input.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * 16777619) & 0xFFFFFFFF;
  }
  return hash;
}
