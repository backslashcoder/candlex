import '../../../core/enums.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/mock/signal_factory.dart';
import '../../../core/models/strategy.dart';
import '../../../core/models/trading_signal.dart';
import '../domain/strategy_repository.dart';

class MockStrategyRepository implements StrategyRepository {
  MockStrategyRepository(this._store) {
    _ensureSeeded();
  }

  final MarketDataStore _store;
  final SignalFactory _factory = const SignalFactory();

  void _ensureSeeded() {
    if (_store.signals.isEmpty) {
      final signals = _factory.build(_store.stocks);
      _store.setSignals(signals);
      _store.setAlerts(_factory.buildAlerts(signals));
    }
  }

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<List<TradingSignal>> getSignals() async {
    await Future<void>.delayed(const Duration(milliseconds: 240));
    return _store.signals;
  }

  @override
  List<TradingSignal> signalsNow() => _store.signals;

  @override
  TradingSignal? signal(String id) {
    for (final s in _store.signals) {
      if (s.id == id) return s;
    }
    return null;
  }

  @override
  Future<List<Strategy>> getStrategies() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final signals = _store.signals;
    return StrategyType.values.map((type) {
      final active = signals
          .where((s) => s.strategy == type && s.isActive)
          .length;
      return Strategy(
        type: type,
        description: _describe(type),
        activeCount: active,
        winRateHeuristic: 48 + (type.index * 6) % 24 + 6,
      );
    }).toList();
  }

  String _describe(StrategyType type) => switch (type) {
        StrategyType.vwapTrendContinuation =>
          'Enters pullbacks into VWAP in the direction of the intraday trend.',
        StrategyType.openingRangeBreakout =>
          'Trades breaks of the first 15-minute range with volume confirmation.',
        StrategyType.orderBlockRetest =>
          'Fades retests of institutional demand/supply order blocks.',
        StrategyType.liquiditySweepReversal =>
          'Reversals after liquidity is swept beyond prior swing points.',
        StrategyType.momentumBreakout =>
          'Breakouts in relative-strength leaders on volume expansion.',
      };
}
