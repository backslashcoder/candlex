import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'market_index.freezed.dart';
part 'market_index.g.dart';

/// A headline market index (NIFTY 50, BANK NIFTY, India VIX, ...).
@freezed
abstract class MarketIndex with _$MarketIndex {
  const factory MarketIndex({
    required String symbol,
    required String name,
    required double value,
    required double previousClose,
    @Default(false) bool isVolatilityIndex,
  }) = _MarketIndex;

  const MarketIndex._();

  factory MarketIndex.fromJson(Map<String, dynamic> json) =>
      _$MarketIndexFromJson(json);

  double get change => value - previousClose;
  double get changePercent =>
      previousClose == 0 ? 0 : (value - previousClose) / previousClose * 100;
  Direction get direction {
    // For VIX, a rise is typically "risk-off" but we color by raw move.
    if (change > 0) return Direction.bullish;
    if (change < 0) return Direction.bearish;
    return Direction.neutral;
  }
}
