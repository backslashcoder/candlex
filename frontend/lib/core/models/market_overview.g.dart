// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketOverview _$MarketOverviewFromJson(Map<String, dynamic> json) =>
    _MarketOverview(
      indices: (json['indices'] as List<dynamic>)
          .map((e) => MarketIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      breadth: MarketBreadth.fromJson(json['breadth'] as Map<String, dynamic>),
      sentiment: $enumDecode(_$DirectionEnumMap, json['sentiment']),
      participation: (json['participation'] as num).toDouble(),
      leadingSector: json['leadingSector'] as String,
      weakestSector: json['weakestSector'] as String,
      session: $enumDecode(_$MarketSessionEnumMap, json['session']),
      asOf: DateTime.parse(json['asOf'] as String),
    );

Map<String, dynamic> _$MarketOverviewToJson(_MarketOverview instance) =>
    <String, dynamic>{
      'indices': instance.indices,
      'breadth': instance.breadth,
      'sentiment': _$DirectionEnumMap[instance.sentiment]!,
      'participation': instance.participation,
      'leadingSector': instance.leadingSector,
      'weakestSector': instance.weakestSector,
      'session': _$MarketSessionEnumMap[instance.session]!,
      'asOf': instance.asOf.toIso8601String(),
    };

const _$DirectionEnumMap = {
  Direction.bullish: 'bullish',
  Direction.bearish: 'bearish',
  Direction.neutral: 'neutral',
};

const _$MarketSessionEnumMap = {
  MarketSession.preMarket: 'preMarket',
  MarketSession.open: 'open',
  MarketSession.closed: 'closed',
  MarketSession.weekendHoliday: 'weekendHoliday',
};
