part of 'signals_cubit.dart';

class SignalsState extends Equatable {
  const SignalsState({
    this.status = ViewStatus.initial,
    this.signals = const [],
    this.strategies = const [],
    this.statusFilter,
    this.strategyFilter,
    this.error,
  });

  final ViewStatus status;
  final List<TradingSignal> signals;
  final List<Strategy> strategies;
  final SignalStatus? statusFilter;
  final StrategyType? strategyFilter;
  final String? error;

  List<TradingSignal> get visible {
    return signals.where((s) {
      final byStatus = statusFilter == null || s.status == statusFilter;
      final byStrategy = strategyFilter == null || s.strategy == strategyFilter;
      return byStatus && byStrategy;
    }).toList();
  }

  int countFor(SignalStatus status) =>
      signals.where((s) => s.status == status).length;

  SignalsState copyWith({
    ViewStatus? status,
    List<TradingSignal>? signals,
    List<Strategy>? strategies,
    SignalStatus? statusFilter,
    bool clearStatus = false,
    StrategyType? strategyFilter,
    bool clearStrategy = false,
    String? error,
  }) {
    return SignalsState(
      status: status ?? this.status,
      signals: signals ?? this.signals,
      strategies: strategies ?? this.strategies,
      statusFilter: clearStatus ? null : (statusFilter ?? this.statusFilter),
      strategyFilter:
          clearStrategy ? null : (strategyFilter ?? this.strategyFilter),
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [status, signals, strategies, statusFilter, strategyFilter, error];
}
