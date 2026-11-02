import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/mock/market_data_store.dart';
import '../../../../core/models/market_breadth.dart';
import '../../../../core/models/stock.dart';

part 'market_breadth_state.dart';

class MarketBreadthCubit extends Cubit<MarketBreadthState> {
  MarketBreadthCubit(this._store) : super(const MarketBreadthState());

  final MarketDataStore _store;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    await Future<void>.delayed(const Duration(milliseconds: 200));
    emit(state.copyWith(
      status: ViewStatus.loaded,
      stocks: _store.stocks,
      breadth: _store.breadth(),
    ));
    _tickSub ??= _store.ticks.listen((_) {
      if (state.status.isLoaded) {
        emit(state.copyWith(stocks: _store.stocks, breadth: _store.breadth()));
      }
    });
  }

  void setSectorFilter(String? sector) => emit(sector == null
      ? state.copyWith(clearSector: true)
      : state.copyWith(sectorFilter: sector));

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
