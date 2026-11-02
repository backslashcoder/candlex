part of 'market_breadth_cubit.dart';

class MarketBreadthState extends Equatable {
  const MarketBreadthState({
    this.status = ViewStatus.initial,
    this.stocks = const [],
    this.breadth,
    this.sectorFilter,
  });

  final ViewStatus status;
  final List<Stock> stocks;
  final MarketBreadth? breadth;
  final String? sectorFilter;

  List<Stock> get filtered => sectorFilter == null
      ? stocks
      : stocks.where((s) => s.sector == sectorFilter).toList();

  List<String> get sectors =>
      (stocks.map((s) => s.sector).toSet().toList()..sort());

  MarketBreadthState copyWith({
    ViewStatus? status,
    List<Stock>? stocks,
    MarketBreadth? breadth,
    String? sectorFilter,
    bool clearSector = false,
  }) {
    return MarketBreadthState(
      status: status ?? this.status,
      stocks: stocks ?? this.stocks,
      breadth: breadth ?? this.breadth,
      sectorFilter: clearSector ? null : (sectorFilter ?? this.sectorFilter),
    );
  }

  @override
  List<Object?> get props => [status, stocks, breadth, sectorFilter];
}
