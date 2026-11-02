import 'package:candlex/core/enums.dart';
import 'package:candlex/core/models/stock.dart';
import 'package:candlex/core/models/trading_signal.dart';
import 'package:flutter_test/flutter_test.dart';

Stock _stock({double ltp = 110, double prev = 100}) => Stock(
      symbol: 'TEST',
      name: 'Test Co',
      sector: 'IT',
      exchange: Exchange.nse,
      ltp: ltp,
      previousClose: prev,
      dayHigh: ltp + 5,
      dayLow: prev - 5,
      open: prev,
      volume: 2000,
      avgVolume: 1000,
      marketCap: 1e12,
      strengthScore: 80,
      liquidityScore: 70,
      vwap: 105,
      rank: 2,
      previousRank: 5,
    );

void main() {
  group('Stock', () {
    test('derived getters', () {
      final s = _stock();
      expect(s.change, closeTo(10, 0.001));
      expect(s.changePercent, closeTo(10, 0.001));
      expect(s.direction, Direction.bullish);
      expect(s.volumeRatio, closeTo(2.0, 0.001));
      expect(s.rankMovement, 3); // improved from 5 -> 2
    });

    test('bearish direction', () {
      expect(_stock(ltp: 90).direction, Direction.bearish);
    });

    test('json round-trip', () {
      final s = _stock();
      final decoded = Stock.fromJson(s.toJson());
      expect(decoded, s);
      expect(decoded.exchange, Exchange.nse);
    });
  });

  group('TradingSignal', () {
    final sig = TradingSignal(
      id: 'SIG-1',
      symbol: 'TEST',
      sector: 'IT',
      strategy: StrategyType.momentumBreakout,
      direction: Direction.bullish,
      timeframe: Timeframe.m15,
      entryLow: 100,
      entryHigh: 102,
      stopLoss: 96,
      target1: 110,
      target2: 118,
      status: SignalStatus.active,
      confidence: SignalConfidence.high,
      confidenceScore: 80,
      createdAt: DateTime(2026, 1, 1),
      reasoning: 'test',
    );

    test('riskReward positive', () {
      expect(sig.riskReward, greaterThan(0));
    });

    test('isActive', () {
      expect(sig.isActive, isTrue);
      expect(sig.copyWith(status: SignalStatus.expired).isActive, isFalse);
    });

    test('json round-trip', () {
      expect(TradingSignal.fromJson(sig.toJson()), sig);
    });
  });
}
