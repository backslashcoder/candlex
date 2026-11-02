part of 'sectors_cubit.dart';

class SectorsState extends Equatable {
  const SectorsState({
    this.status = ViewStatus.initial,
    this.sectors = const [],
    this.stocks = const [],
    this.selected,
  });

  final ViewStatus status;
  final List<SectorPerformance> sectors;
  final List<Stock> stocks;
  final String? selected;

  SectorPerformance? get selectedSector {
    if (sectors.isEmpty) return null;
    for (final s in sectors) {
      if (s.name == selected) return s;
    }
    return sectors.first;
  }

  List<Stock> constituents(String sector) =>
      (stocks.where((s) => s.sector == sector).toList()
        ..sort((a, b) => b.changePercent.compareTo(a.changePercent)));

  SectorsState copyWith({
    ViewStatus? status,
    List<SectorPerformance>? sectors,
    List<Stock>? stocks,
    String? selected,
  }) {
    return SectorsState(
      status: status ?? this.status,
      sectors: sectors ?? this.sectors,
      stocks: stocks ?? this.stocks,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [status, sectors, stocks, selected];
}
