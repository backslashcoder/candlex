import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/mock/market_data_store.dart';
import '../../../../core/models/sector.dart';
import '../../../../core/models/stock.dart';

part 'sectors_state.dart';

class SectorsCubit extends Cubit<SectorsState> {
  SectorsCubit(this._store) : super(const SectorsState());

  final MarketDataStore _store;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final sectors = _store.sectors();
    emit(state.copyWith(
      status: ViewStatus.loaded,
      sectors: sectors,
      stocks: _store.stocks,
      selected: state.selected ?? (sectors.isNotEmpty ? sectors.first.name : null),
    ));
    _tickSub ??= _store.ticks.listen((_) {
      if (state.status.isLoaded) {
        emit(state.copyWith(sectors: _store.sectors(), stocks: _store.stocks));
      }
    });
  }

  void select(String sector) => emit(state.copyWith(selected: sector));

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
