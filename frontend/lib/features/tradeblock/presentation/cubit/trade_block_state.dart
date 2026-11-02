part of 'trade_block_cubit.dart';

class TradeBlockState extends Equatable {
  const TradeBlockState({
    this.status = ViewStatus.initial,
    this.board = TradeBlockBoard.empty,
    this.selectedSymbol,
    this.categoryFilter,
    this.error,
  });

  final ViewStatus status;
  final TradeBlockBoard board;
  final String? selectedSymbol;
  final OiBuildup? categoryFilter;
  final String? error;

  /// Featured setups, filtered by the active category (if any) and with the
  /// selected symbol pinned to the front.
  List<TradeBlockEntry> get featured {
    var list = board.featured;
    if (categoryFilter != null) {
      list = list.where((e) => e.buildup == categoryFilter).toList();
      // If the filtered category isn't in the featured set, fall back to its
      // strongest members so the column is never unexpectedly empty.
      if (list.isEmpty) {
        list = board.forBuildup(categoryFilter!).take(6).toList();
      }
    }
    if (selectedSymbol != null) {
      final idx = list.indexWhere((e) => e.symbol == selectedSymbol);
      if (idx > 0) {
        list = [list[idx], ...list]..removeAt(idx + 1);
      } else if (idx == -1) {
        final sel = board.bySymbol(selectedSymbol!);
        if (sel != null && sel.buildup != OiBuildup.neutral) {
          list = [sel, ...list];
        }
      }
    }
    return list;
  }

  TradeBlockEntry? get selectedEntry =>
      selectedSymbol == null ? null : board.bySymbol(selectedSymbol!);

  TradeBlockState copyWith({
    ViewStatus? status,
    TradeBlockBoard? board,
    String? selectedSymbol,
    bool clearSelected = false,
    OiBuildup? categoryFilter,
    bool clearCategory = false,
    String? error,
  }) {
    return TradeBlockState(
      status: status ?? this.status,
      board: board ?? this.board,
      selectedSymbol:
          clearSelected ? null : (selectedSymbol ?? this.selectedSymbol),
      categoryFilter:
          clearCategory ? null : (categoryFilter ?? this.categoryFilter),
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [status, board, selectedSymbol, categoryFilter, error];
}
