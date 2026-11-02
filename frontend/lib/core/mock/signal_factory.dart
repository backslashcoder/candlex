import '../enums.dart';
import '../models/alert.dart';
import '../models/stock.dart';
import '../models/trading_signal.dart';
import '../utils/seeded_random.dart';

/// Builds a deterministic, internally-consistent set of simulated trading
/// signals and the matching alert history from the current stock universe.
class SignalFactory {
  const SignalFactory();

  List<TradingSignal> build(List<Stock> stocks) {
    final rng = SeededRandom(stableHash('signals-v1'));
    final signals = <TradingSignal>[];
    // Favor stronger movers for signal generation.
    final pool = stocks.toList()
      ..sort((a, b) => b.strengthScore.compareTo(a.strengthScore));
    final strategies = StrategyType.values;

    const statuses = SignalStatus.values;
    int idCounter = 1000;

    for (int i = 0; i < 26 && i < pool.length; i++) {
      final s = pool[rng.intRange(0, pool.length - 1)];
      final direction =
          s.direction == Direction.bearish ? Direction.bearish : Direction.bullish;
      final strategy = strategies[rng.intRange(0, strategies.length - 1)];
      final tf = Timeframe.values[rng.intRange(1, 5)];
      final status = statuses[rng.intRange(0, statuses.length - 1)];

      final isLong = direction == Direction.bullish;
      final entryMid = s.ltp;
      final band = s.ltp * rng.range(0.002, 0.006);
      final risk = s.ltp * rng.range(0.006, 0.014);
      final reward1 = risk * rng.range(1.3, 2.2);
      final reward2 = reward1 * rng.range(1.4, 2.0);

      final entryLow = entryMid - band;
      final entryHigh = entryMid + band;
      final stop = isLong ? entryMid - risk : entryMid + risk;
      final t1 = isLong ? entryMid + reward1 : entryMid - reward1;
      final t2 = isLong ? entryMid + reward2 : entryMid - reward2;

      final confScore = double.parse(rng.range(52, 92).toStringAsFixed(0));
      final conf = confScore >= 78
          ? SignalConfidence.high
          : confScore >= 64
              ? SignalConfidence.medium
              : SignalConfidence.low;

      signals.add(TradingSignal(
        id: 'SIG-${idCounter++}',
        symbol: s.symbol,
        sector: s.sector,
        strategy: strategy,
        direction: direction,
        timeframe: tf,
        entryLow: _r(entryLow),
        entryHigh: _r(entryHigh),
        stopLoss: _r(stop),
        target1: _r(t1),
        target2: _r(t2),
        status: status,
        confidence: conf,
        confidenceScore: confScore,
        currentPrice: s.ltp,
        createdAt: DateTime.now()
            .subtract(Duration(minutes: rng.intRange(2, 320))),
        reasoning: _reason(strategy, direction, s),
      ));
    }
    signals.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return signals;
  }

  List<Alert> buildAlerts(List<TradingSignal> signals) {
    final rng = SeededRandom(stableHash('alerts-v1'));
    final alerts = <Alert>[];
    for (int i = 0; i < signals.length && i < 18; i++) {
      final sig = signals[i];
      final kind = sig.direction == Direction.bullish
          ? AlertKind.bullishSignal
          : AlertKind.bearishSignal;
      alerts.add(Alert(
        id: 'ALT-${1 + i}',
        kind: kind,
        symbol: sig.symbol,
        direction: sig.direction,
        message:
            '${sig.strategy.shortLabel} ${sig.direction.label.toLowerCase()} setup on ${sig.symbol} • entry ${sig.entryLow.toStringAsFixed(1)}–${sig.entryHigh.toStringAsFixed(1)}',
        time: sig.createdAt,
        delivered: rng.chance(0.85),
      ));
    }
    alerts.sort((a, b) => b.time.compareTo(a.time));
    return alerts;
  }

  String _reason(StrategyType strategy, Direction dir, Stock s) {
    final d = dir == Direction.bullish ? 'bullish' : 'bearish';
    return switch (strategy) {
      StrategyType.vwapTrendContinuation =>
        'Price holding ${dir == Direction.bullish ? 'above' : 'below'} VWAP with trend intact; $d continuation expected on pullback.',
      StrategyType.openingRangeBreakout =>
        'Opening range ${dir == Direction.bullish ? 'high' : 'low'} breached on expanding volume (${s.volumeRatio.toStringAsFixed(1)}x avg).',
      StrategyType.orderBlockRetest =>
        'Retest of $d order block holding; strength score ${s.strengthScore.toStringAsFixed(0)} supports continuation.',
      StrategyType.liquiditySweepReversal =>
        'Liquidity swept beyond prior ${dir == Direction.bullish ? 'low' : 'high'} then reclaimed; reversal signature.',
      StrategyType.momentumBreakout =>
        'Momentum breakout with volume surge; relative strength leading its ${s.sector} peers.',
    };
  }

  double _r(double v) => double.parse(v.toStringAsFixed(2));
}
