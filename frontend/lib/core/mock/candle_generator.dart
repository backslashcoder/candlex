import '../enums.dart';
import '../models/candle.dart';
import '../utils/seeded_random.dart';

/// Generates deterministic, continuous OHLCV candles for a symbol/timeframe,
/// anchored so the final close lands near the live LTP. Also computes the
/// VWAP and EMA(9/21) overlays per bar.
class CandleGenerator {
  const CandleGenerator();

  List<Candle> generate({
    required String symbol,
    required Timeframe timeframe,
    required double currentPrice,
    int count = 160,
  }) {
    final rng = SeededRandom(stableHash('$symbol-${timeframe.name}'));
    final minutes = timeframe.minutes;
    final now = DateTime.now();

    // Build a random-walk of closes backwards from currentPrice, then reverse.
    final closes = <double>[currentPrice];
    final volatility = _volatility(timeframe);
    for (int i = 1; i < count; i++) {
      final prev = closes.last;
      final drift = rng.noise(prev * volatility);
      // Gentle mean-reverting walk so the series stays plausible.
      final pull = (currentPrice - prev) * 0.015;
      closes.add((prev - drift - pull).clamp(currentPrice * 0.6, currentPrice * 1.4));
    }
    final orderedCloses = closes.reversed.toList();

    final candles = <Candle>[];
    double cumVolPrice = 0;
    double cumVol = 0;
    double? ema9;
    double? ema21;

    for (int i = 0; i < count; i++) {
      final close = orderedCloses[i];
      final open = i == 0 ? close * (1 + rng.noise(0.002)) : candles[i - 1].close;
      final body = (close - open).abs();
      final wick = (close * volatility) * rng.range(0.4, 1.6);
      final high = (open > close ? open : close) + body * 0.3 + wick;
      final low = (open < close ? open : close) - body * 0.3 - wick;
      final volume = rng.range(0.6, 1.0) * 1e6 +
          body / close * 8e6 * rng.range(0.5, 1.5);

      final typical = (high + low + close) / 3;
      cumVolPrice += typical * volume;
      cumVol += volume;
      final vwap = cumVol == 0 ? close : cumVolPrice / cumVol;

      ema9 = _ema(close, ema9, 9);
      ema21 = _ema(close, ema21, 21);

      candles.add(Candle(
        time: now.subtract(Duration(minutes: (count - 1 - i) * minutes)),
        open: _r(open),
        high: _r(high),
        low: _r(low),
        close: _r(close),
        volume: volume,
        vwap: _r(vwap),
        ema9: _r(ema9),
        ema21: _r(ema21),
      ));
    }
    return candles;
  }

  double _volatility(Timeframe tf) => switch (tf) {
        Timeframe.m1 => 0.0012,
        Timeframe.m3 => 0.0020,
        Timeframe.m5 => 0.0028,
        Timeframe.m15 => 0.0045,
        Timeframe.m30 => 0.0060,
        Timeframe.h1 => 0.0085,
        Timeframe.d1 => 0.0150,
      };

  double _ema(double price, double? prev, int period) {
    final k = 2 / (period + 1);
    if (prev == null) return price;
    return price * k + prev * (1 - k);
  }

  double _r(double v) => (v * 100).roundToDouble() / 100;
}
