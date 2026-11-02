import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/mock/market_data_store.dart';
import '../../../../core/models/watchlist.dart';
import '../../domain/watchlist_repository.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(this._repo, this._store) : super(const WatchlistState());

  final WatchlistRepository _repo;
  final MarketDataStore _store;
  StreamSubscription<void>? _tickSub;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final lists = await _repo.getWatchlists();
      emit(state.copyWith(
        status: ViewStatus.loaded,
        watchlists: lists,
        selectedId: lists.isNotEmpty ? lists.first.id : null,
      ));
      // Refresh LTP/scores on tick by re-emitting (lists unchanged).
      _tickSub ??= _store.ticks.listen((_) {
        if (state.status.isLoaded) {
          emit(state.copyWith(watchlists: List.of(state.watchlists)));
        }
      });
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  void select(String id) => emit(state.copyWith(selectedId: id));

  Future<void> _persist(List<Watchlist> lists, {String? selectedId}) async {
    emit(state.copyWith(
        watchlists: lists, selectedId: selectedId ?? state.selectedId));
    await _repo.saveAll(lists);
  }

  Future<void> createWatchlist(String name) async {
    final id = 'wl_${DateTime.now().millisecondsSinceEpoch}';
    final created = Watchlist(id: id, name: name, symbols: const []);
    await _persist([...state.watchlists, created], selectedId: id);
  }

  Future<void> renameWatchlist(String id, String name) async {
    final lists = state.watchlists
        .map((w) => w.id == id ? w.copyWith(name: name) : w)
        .toList();
    await _persist(lists);
  }

  Future<void> deleteWatchlist(String id) async {
    final lists = state.watchlists.where((w) => w.id != id).toList();
    await _persist(lists,
        selectedId: lists.isNotEmpty ? lists.first.id : null);
  }

  Future<void> addSymbol(String id, String symbol) async {
    final lists = state.watchlists.map((w) {
      if (w.id != id || w.symbols.contains(symbol)) return w;
      return w.copyWith(symbols: [...w.symbols, symbol]);
    }).toList();
    await _persist(lists);
  }

  Future<void> removeSymbol(String id, String symbol) async {
    final lists = state.watchlists.map((w) {
      if (w.id != id) return w;
      return w.copyWith(
          symbols: w.symbols.where((s) => s != symbol).toList());
    }).toList();
    await _persist(lists);
  }

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
