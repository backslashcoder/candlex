// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SectorPerformance _$SectorPerformanceFromJson(Map<String, dynamic> json) =>
    _SectorPerformance(
      name: json['name'] as String,
      avgChangePercent: (json['avgChangePercent'] as num).toDouble(),
      bullishCount: (json['bullishCount'] as num).toInt(),
      bearishCount: (json['bearishCount'] as num).toInt(),
      relativeStrength: (json['relativeStrength'] as num).toDouble(),
      rank: (json['rank'] as num).toInt(),
      previousRank: (json['previousRank'] as num?)?.toInt() ?? 0,
      topBullish:
          (json['topBullish'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      topBearish:
          (json['topBearish'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$SectorPerformanceToJson(_SectorPerformance instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avgChangePercent': instance.avgChangePercent,
      'bullishCount': instance.bullishCount,
      'bearishCount': instance.bearishCount,
      'relativeStrength': instance.relativeStrength,
      'rank': instance.rank,
      'previousRank': instance.previousRank,
      'topBullish': instance.topBullish,
      'topBearish': instance.topBearish,
    };
