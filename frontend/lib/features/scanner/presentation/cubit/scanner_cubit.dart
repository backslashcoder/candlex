import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/widgets/stock_table.dart';
import '../../domain/scanner_filter.dart';
import '../../domain/scanner_repository.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit(this._repo) : super(const ScannerState());

  final ScannerRepository _repo;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final stocks = await _repo.getAllStocks();
      emit(state.copyWith(status: ViewStatus.loaded, allStocks: stocks));
      _tickSub ??= _repo.ticks.listen((_) {
        if (state.status.isLoaded) {
          emit(state.copyWith(allStocks: _repo.allStocksNow()));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  void setTab(ScannerTab tab) => emit(state.copyWith(tab: tab));
  void setFilter(ScannerFilter filter) => emit(state.copyWith(filter: filter));
  void resetFilter() => emit(state.copyWith(filter: const ScannerFilter()));

  void sort(StockColumn column) {
    if (state.sortColumn == column) {
      emit(state.copyWith(sortAscending: !state.sortAscending));
    } else {
      emit(state.copyWith(sortColumn: column, sortAscending: false));
    }
  }

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
