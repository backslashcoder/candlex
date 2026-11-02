import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/enums.dart';
import '../../../../core/models/strategy.dart';
import '../../../../core/models/trading_signal.dart';
import '../../domain/strategy_repository.dart';

part 'signals_state.dart';

class SignalsCubit extends Cubit<SignalsState> {
  SignalsCubit(this._repo) : super(const SignalsState());

  final StrategyRepository _repo;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final signals = await _repo.getSignals();
      final strategies = await _repo.getStrategies();
      emit(state.copyWith(
        status: ViewStatus.loaded,
        signals: signals,
        strategies: strategies,
      ));
      _tickSub ??= _repo.ticks.listen((_) {
        if (state.status.isLoaded) {
          emit(state.copyWith(signals: _repo.signalsNow()));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  void setStatusFilter(SignalStatus? status) => emit(status == null
      ? state.copyWith(clearStatus: true)
      : state.copyWith(statusFilter: status));

  void setStrategyFilter(StrategyType? strategy) => emit(strategy == null
      ? state.copyWith(clearStrategy: true)
      : state.copyWith(strategyFilter: strategy));

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
