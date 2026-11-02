part of 'stock_detail_cubit.dart';

class StockDetailState extends Equatable {
  const StockDetailState({
    this.status = ViewStatus.initial,
    this.stock,
    this.candles = const [],
    this.analysis,
    this.timeframe = Timeframe.m15,
    this.config = const ChartOverlayConfig(),
    this.error,
  });

  final ViewStatus status;
  final Stock? stock;
  final List<Candle> candles;
  final TechnicalAnalysis? analysis;
  final Timeframe timeframe;
  final ChartOverlayConfig config;
  final String? error;

  StockDetailState copyWith({
    ViewStatus? status,
    Stock? stock,
    List<Candle>? candles,
    TechnicalAnalysis? analysis,
    Timeframe? timeframe,
    ChartOverlayConfig? config,
    String? error,
  }) {
    return StockDetailState(
      status: status ?? this.status,
      stock: stock ?? this.stock,
      candles: candles ?? this.candles,
      analysis: analysis ?? this.analysis,
      timeframe: timeframe ?? this.timeframe,
      config: config ?? this.config,
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [status, stock, candles, analysis, timeframe, config, error];
}
