import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_breadth.freezed.dart';
part 'market_breadth.g.dart';

/// Market-wide participation statistics.
@freezed
abstract class MarketBreadth with _$MarketBreadth {
  const factory MarketBreadth({
    required int advances,
    required int declines,
    required int unchanged,
    required int newHighs,
    required int newLows,
    required int aboveVwap,
    required int belowVwap,
    @Default(<int>[]) List<int> strengthDistribution,
  }) = _MarketBreadth;

  const MarketBreadth._();

  factory MarketBreadth.fromJson(Map<String, dynamic> json) =>
      _$MarketBreadthFromJson(json);

  int get total => advances + declines + unchanged;
  double get advanceDeclineRatio =>
      declines == 0 ? advances.toDouble() : advances / declines;
  double get advancePercent => total == 0 ? 0 : advances / total * 100;
  double get declinePercent => total == 0 ? 0 : declines / total * 100;
}
