import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';
import 'market_breadth.dart';
import 'market_index.dart';

part 'market_overview.freezed.dart';
part 'market_overview.g.dart';

/// Top-level snapshot that drives the Market Overview screen header.
@freezed
abstract class MarketOverview with _$MarketOverview {
  const factory MarketOverview({
    required List<MarketIndex> indices,
    required MarketBreadth breadth,
    required Direction sentiment,
    required double participation,
    required String leadingSector,
    required String weakestSector,
    required MarketSession session,
    required DateTime asOf,
  }) = _MarketOverview;

  factory MarketOverview.fromJson(Map<String, dynamic> json) =>
      _$MarketOverviewFromJson(json);
}
