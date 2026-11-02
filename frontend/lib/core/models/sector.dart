import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'sector.freezed.dart';
part 'sector.g.dart';

/// Aggregated performance of one market sector.
@freezed
abstract class SectorPerformance with _$SectorPerformance {
  const factory SectorPerformance({
    required String name,
    required double avgChangePercent,
    required int bullishCount,
    required int bearishCount,
    required double relativeStrength,
    required int rank,
    @Default(0) int previousRank,
    @Default(<String>[]) List<String> topBullish,
    @Default(<String>[]) List<String> topBearish,
  }) = _SectorPerformance;

  const SectorPerformance._();

  factory SectorPerformance.fromJson(Map<String, dynamic> json) =>
      _$SectorPerformanceFromJson(json);

  int get totalStocks => bullishCount + bearishCount;
  double get bullishParticipation =>
      totalStocks == 0 ? 0 : bullishCount / totalStocks * 100;
  Direction get direction {
    if (avgChangePercent > 0.05) return Direction.bullish;
    if (avgChangePercent < -0.05) return Direction.bearish;
    return Direction.neutral;
  }

  int get rankMovement => previousRank == 0 ? 0 : previousRank - rank;
}
