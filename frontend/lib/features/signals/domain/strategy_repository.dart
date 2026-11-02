import '../../../core/models/strategy.dart';
import '../../../core/models/trading_signal.dart';

abstract class StrategyRepository {
  Future<List<TradingSignal>> getSignals();
  Future<List<Strategy>> getStrategies();
  List<TradingSignal> signalsNow();
  TradingSignal? signal(String id);
  Stream<void> get ticks;
}
