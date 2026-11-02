part of 'overview_cubit.dart';

class OverviewState extends Equatable {
  const OverviewState({
    this.status = ViewStatus.initial,
    this.overview,
    this.bullish = const [],
    this.bearish = const [],
    this.sectors = const [],
    this.error,
  });

  final ViewStatus status;
  final MarketOverview? overview;
  final List<Stock> bullish;
  final List<Stock> bearish;
  final List<SectorPerformance> sectors;
  final String? error;

  OverviewState copyWith({
    ViewStatus? status,
    MarketOverview? overview,
    List<Stock>? bullish,
    List<Stock>? bearish,
    List<SectorPerformance>? sectors,
    String? error,
  }) {
    return OverviewState(
      status: status ?? this.status,
      overview: overview ?? this.overview,
      bullish: bullish ?? this.bullish,
      bearish: bearish ?? this.bearish,
      sectors: sectors ?? this.sectors,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, overview, bullish, bearish, sectors, error];
}
