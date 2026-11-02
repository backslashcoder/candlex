// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_breadth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketBreadth _$MarketBreadthFromJson(Map<String, dynamic> json) =>
    _MarketBreadth(
      advances: (json['advances'] as num).toInt(),
      declines: (json['declines'] as num).toInt(),
      unchanged: (json['unchanged'] as num).toInt(),
      newHighs: (json['newHighs'] as num).toInt(),
      newLows: (json['newLows'] as num).toInt(),
      aboveVwap: (json['aboveVwap'] as num).toInt(),
      belowVwap: (json['belowVwap'] as num).toInt(),
      strengthDistribution:
          (json['strengthDistribution'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
    );

Map<String, dynamic> _$MarketBreadthToJson(_MarketBreadth instance) =>
    <String, dynamic>{
      'advances': instance.advances,
      'declines': instance.declines,
      'unchanged': instance.unchanged,
      'newHighs': instance.newHighs,
      'newLows': instance.newLows,
      'aboveVwap': instance.aboveVwap,
      'belowVwap': instance.belowVwap,
      'strengthDistribution': instance.strengthDistribution,
    };
