// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Strategy _$StrategyFromJson(Map<String, dynamic> json) => _Strategy(
  type: $enumDecode(_$StrategyTypeEnumMap, json['type']),
  description: json['description'] as String,
  activeCount: (json['activeCount'] as num).toInt(),
  winRateHeuristic: (json['winRateHeuristic'] as num).toDouble(),
);

Map<String, dynamic> _$StrategyToJson(_Strategy instance) => <String, dynamic>{
  'type': _$StrategyTypeEnumMap[instance.type]!,
  'description': instance.description,
  'activeCount': instance.activeCount,
  'winRateHeuristic': instance.winRateHeuristic,
};

const _$StrategyTypeEnumMap = {
  StrategyType.vwapTrendContinuation: 'vwapTrendContinuation',
  StrategyType.openingRangeBreakout: 'openingRangeBreakout',
  StrategyType.orderBlockRetest: 'orderBlockRetest',
  StrategyType.liquiditySweepReversal: 'liquiditySweepReversal',
  StrategyType.momentumBreakout: 'momentumBreakout',
};
