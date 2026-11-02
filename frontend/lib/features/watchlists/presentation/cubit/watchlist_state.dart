part of 'watchlist_cubit.dart';

class WatchlistState extends Equatable {
  const WatchlistState({
    this.status = ViewStatus.initial,
    this.watchlists = const [],
    this.selectedId,
    this.error,
  });

  final ViewStatus status;
  final List<Watchlist> watchlists;
  final String? selectedId;
  final String? error;

  Watchlist? get selected {
    if (watchlists.isEmpty) return null;
    return watchlists.firstWhere(
      (w) => w.id == selectedId,
      orElse: () => watchlists.first,
    );
  }

  WatchlistState copyWith({
    ViewStatus? status,
    List<Watchlist>? watchlists,
    String? selectedId,
    String? error,
  }) {
    return WatchlistState(
      status: status ?? this.status,
      watchlists: watchlists ?? this.watchlists,
      selectedId: selectedId ?? this.selectedId,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, watchlists, selectedId, error];
}
