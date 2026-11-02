part of 'scanner_cubit.dart';

class ScannerState extends Equatable {
  const ScannerState({
    this.status = ViewStatus.initial,
    this.allStocks = const [],
    this.tab = ScannerTab.all,
    this.filter = const ScannerFilter(),
    this.sortColumn = StockColumn.strength,
    this.sortAscending = false,
    this.error,
  });

  final ViewStatus status;
  final List<Stock> allStocks;
  final ScannerTab tab;
  final ScannerFilter filter;
  final StockColumn sortColumn;
  final bool sortAscending;
  final String? error;

  List<Stock> get visible {
    final list = applyScanner(allStocks, tab, filter);
    list.sort((a, b) {
      final cmp = sortColumn.sortValue(a).compareTo(sortColumn.sortValue(b));
      return sortAscending ? cmp : -cmp;
    });
    return list;
  }

  ScannerState copyWith({
    ViewStatus? status,
    List<Stock>? allStocks,
    ScannerTab? tab,
    ScannerFilter? filter,
    StockColumn? sortColumn,
    bool? sortAscending,
    String? error,
  }) {
    return ScannerState(
      status: status ?? this.status,
      allStocks: allStocks ?? this.allStocks,
      tab: tab ?? this.tab,
      filter: filter ?? this.filter,
      sortColumn: sortColumn ?? this.sortColumn,
      sortAscending: sortAscending ?? this.sortAscending,
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [status, allStocks, tab, filter, sortColumn, sortAscending, error];
}
