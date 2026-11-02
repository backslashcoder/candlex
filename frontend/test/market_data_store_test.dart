import 'package:candlex/core/enums.dart';
import 'package:candlex/core/mock/market_data_store.dart';
import 'package:candlex/core/mock/seed_data.dart';
import 'package:candlex/core/mock/signal_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MarketDataStore store;

  setUp(() => store = MarketDataStore());
  tearDown(() => store.dispose());

  test('initializes full universe and indices', () {
    expect(store.stocks.length, kStockSeeds.length);
    expect(store.indices.length, kIndexSeeds.length);
  });

  test('bullish and bearish partitions are directionally consistent', () {
    for (final s in store.bullish()) {
      expect(s.direction, Direction.bullish);
      expect(s.changePercent, greaterThan(0));
    }
    for (final s in store.bearish()) {
      expect(s.direction, Direction.bearish);
      expect(s.changePercent, lessThan(0));
    }
  });

  test('breadth totals reconcile with universe', () {
    final b = store.breadth();
    expect(b.total, store.stocks.length);
    expect(b.advances + b.declines + b.unchanged, store.stocks.length);
  });

  test('sectors cover the canonical list and are rank-ordered', () {
    final sectors = store.sectors();
    expect(sectors.map((s) => s.name).toSet(), kSectors.toSet());
    for (int i = 0; i < sectors.length; i++) {
      expect(sectors[i].rank, i + 1);
    }
  });

  test('applyTick keeps prices within continuity bounds and emits', () async {
    final before = store.stock('RELIANCE')!.ltp;
    final emitted = store.ticks.first;
    store.applyTick();
    await emitted; // tick stream fired
    final after = store.stock('RELIANCE')!.ltp;
    // Per-tick move is small (<2%).
    expect((after - before).abs() / before, lessThan(0.02));
  });

  test('signal factory produces directionally valid setups', () {
    final signals = const SignalFactory().build(store.stocks);
    expect(signals, isNotEmpty);
    for (final s in signals) {
      expect(s.entryLow, lessThan(s.entryHigh));
      if (s.direction == Direction.bullish) {
        expect(s.stopLoss, lessThanOrEqualTo(s.entryLow));
        expect(s.target1, greaterThanOrEqualTo(s.entryHigh));
        expect(s.target2, greaterThan(s.target1));
      } else {
        expect(s.stopLoss, greaterThanOrEqualTo(s.entryHigh));
        expect(s.target1, lessThanOrEqualTo(s.entryLow));
        expect(s.target2, lessThan(s.target1));
      }
      expect(s.riskReward, greaterThan(0));
    }
  });
}
