// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TechnicalAnalysis _$TechnicalAnalysisFromJson(Map<String, dynamic> json) =>
    _TechnicalAnalysis(
      symbol: json['symbol'] as String,
      trend: $enumDecode(_$TrendDirectionEnumMap, json['trend']),
      momentum: $enumDecode(_$MomentumStatusEnumMap, json['momentum']),
      vwapPosition: $enumDecode(_$VwapPositionEnumMap, json['vwapPosition']),
      volume: $enumDecode(_$VolumeStatusEnumMap, json['volume']),
      orderBlockStatus: $enumDecode(
        _$OrderBlockStatusEnumMap,
        json['orderBlockStatus'],
      ),
      bias: $enumDecode(_$DirectionEnumMap, json['bias']),
      marketStructure: json['marketStructure'] as String,
      liquidityContext: json['liquidityContext'] as String,
      orderBlocks: (json['orderBlocks'] as List<dynamic>)
          .map((e) => OrderBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      liquidityLevels: (json['liquidityLevels'] as List<dynamic>)
          .map((e) => LiquidityLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      swingHighs:
          (json['swingHighs'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const <double>[],
      swingLows:
          (json['swingLows'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const <double>[],
    );

Map<String, dynamic> _$TechnicalAnalysisToJson(_TechnicalAnalysis instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'trend': _$TrendDirectionEnumMap[instance.trend]!,
      'momentum': _$MomentumStatusEnumMap[instance.momentum]!,
      'vwapPosition': _$VwapPositionEnumMap[instance.vwapPosition]!,
      'volume': _$VolumeStatusEnumMap[instance.volume]!,
      'orderBlockStatus': _$OrderBlockStatusEnumMap[instance.orderBlockStatus]!,
      'bias': _$DirectionEnumMap[instance.bias]!,
      'marketStructure': instance.marketStructure,
      'liquidityContext': instance.liquidityContext,
      'orderBlocks': instance.orderBlocks,
      'liquidityLevels': instance.liquidityLevels,
      'swingHighs': instance.swingHighs,
      'swingLows': instance.swingLows,
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.strongUp: 'strongUp',
  TrendDirection.up: 'up',
  TrendDirection.sideways: 'sideways',
  TrendDirection.down: 'down',
  TrendDirection.strongDown: 'strongDown',
};

const _$MomentumStatusEnumMap = {
  MomentumStatus.accelerating: 'accelerating',
  MomentumStatus.steady: 'steady',
  MomentumStatus.fading: 'fading',
  MomentumStatus.weak: 'weak',
};

const _$VwapPositionEnumMap = {
  VwapPosition.above: 'above',
  VwapPosition.at: 'at',
  VwapPosition.below: 'below',
};

const _$VolumeStatusEnumMap = {
  VolumeStatus.surge: 'surge',
  VolumeStatus.high: 'high',
  VolumeStatus.normal: 'normal',
  VolumeStatus.low: 'low',
};

const _$OrderBlockStatusEnumMap = {
  OrderBlockStatus.active: 'active',
  OrderBlockStatus.mitigated: 'mitigated',
  OrderBlockStatus.none: 'none',
};

const _$DirectionEnumMap = {
  Direction.bullish: 'bullish',
  Direction.bearish: 'bearish',
  Direction.neutral: 'neutral',
};
