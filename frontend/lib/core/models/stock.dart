import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

/// A tradable instrument with its current (simulated) market snapshot and
/// the analytical scores the terminal computes for ranking.
@freezed
abstract class Stock with _$Stock {
  const factory Stock({
    required String symbol,
    required String name,
    required String sector,
    required Exchange exchange,
    required double ltp,
    required double previousClose,
    required double dayHigh,
    required double dayLow,
    required double open,
    required double volume,
    required double avgVolume,
    required double marketCap,
    required double strengthScore,
    required double liquidityScore,
    required double vwap,
    @Default(0) int rank,
    @Default(0) int previousRank,
    @Default(OrderBlockStatus.none) OrderBlockStatus orderBlockStatus,
    @Default(true) bool isFno,
  }) = _Stock;

  const Stock._();

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  double get change => ltp - previousClose;

  double get changePercent =>
      previousClose == 0 ? 0 : (ltp - previousClose) / previousClose * 100;

  Direction get direction {
    if (changePercent > 0.05) return Direction.bullish;
    if (changePercent < -0.05) return Direction.bearish;
    return Direction.neutral;
  }

  double get volumeRatio => avgVolume == 0 ? 0 : volume / avgVolume;

  /// Positive => improved (moved up the board), negative => dropped.
  int get rankMovement => previousRank == 0 ? 0 : previousRank - rank;

  bool get isNearVwap => (ltp - vwap).abs() / vwap < 0.004;
}
