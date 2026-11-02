import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../domain/oi_buildup.dart';
import '../../domain/trade_block_board.dart';
import '../../domain/trade_block_entry.dart';
import '../../domain/trade_block_repository.dart';

part 'trade_block_state.dart';

class TradeBlockCubit extends Cubit<TradeBlockState> {
  TradeBlockCubit(this._repo) : super(const TradeBlockState());

  final TradeBlockRepository _repo;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final board = await _repo.getBoard();
      emit(state.copyWith(status: ViewStatus.loaded, board: board));
      _tickSub ??= _repo.ticks.listen((_) {
        if (state.status.isLoaded) {
          emit(state.copyWith(board: _repo.boardNow()));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  /// Selecting an instrument highlights its stream in the flow and pins its
  /// setup. Tapping the same symbol again clears the selection.
  void select(String? symbol) {
    if (symbol == null || symbol == state.selectedSymbol) {
      emit(state.copyWith(clearSelected: true));
    } else {
      emit(state.copyWith(selectedSymbol: symbol));
    }
  }

  void setCategory(OiBuildup? category) {
    if (category == null || category == state.categoryFilter) {
      emit(state.copyWith(clearCategory: true));
    } else {
      emit(state.copyWith(categoryFilter: category));
    }
  }

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
