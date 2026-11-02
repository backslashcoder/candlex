import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/models/market_overview.dart';
import '../../../../core/models/sector.dart';
import '../../../../core/models/stock.dart';
import '../../domain/market_repository.dart';

part 'overview_state.dart';

/// Drives the Market Overview screen. Loads once, then refreshes live values
/// from the tick stream without re-triggering the loading state.
class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(this._repo) : super(const OverviewState());

  final MarketRepository _repo;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final overview = await _repo.getMarketOverview();
      final bullish = await _repo.getBullishStocks();
      final bearish = await _repo.getBearishStocks();
      final sectors = await _repo.getSectorPerformance();
      emit(state.copyWith(
        status: ViewStatus.loaded,
        overview: overview,
        bullish: bullish,
        bearish: bearish,
        sectors: sectors,
      ));
      _tickSub ??= _repo.ticks.listen((_) => _refresh());
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  void _refresh() {
    if (!state.status.isLoaded) return;
    emit(state.copyWith(
      overview: _repo.overviewNow(),
      bullish: _repo.bullishNow(),
      bearish: _repo.bearishNow(),
      sectors: _repo.sectorsNow(),
    ));
  }

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
