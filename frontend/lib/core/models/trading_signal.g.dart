// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_signal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TradingSignal _$TradingSignalFromJson(Map<String, dynamic> json) =>
    _TradingSignal(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      sector: json['sector'] as String,
      strategy: $enumDecode(_$StrategyTypeEnumMap, json['strategy']),
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
      timeframe: $enumDecode(_$TimeframeEnumMap, json['timeframe']),
      entryLow: (json['entryLow'] as num).toDouble(),
      entryHigh: (json['entryHigh'] as num).toDouble(),
      stopLoss: (json['stopLoss'] as num).toDouble(),
      target1: (json['target1'] as num).toDouble(),
      target2: (json['target2'] as num).toDouble(),
      status: $enumDecode(_$SignalStatusEnumMap, json['status']),
      confidence: $enumDecode(_$SignalConfidenceEnumMap, json['confidence']),
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      reasoning: json['reasoning'] as String,
      currentPrice: (json['currentPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$TradingSignalToJson(_TradingSignal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'sector': instance.sector,
      'strategy': _$StrategyTypeEnumMap[instance.strategy]!,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'timeframe': _$TimeframeEnumMap[instance.timeframe]!,
      'entryLow': instance.entryLow,
      'entryHigh': instance.entryHigh,
      'stopLoss': instance.stopLoss,
      'target1': instance.target1,
      'target2': instance.target2,
      'status': _$SignalStatusEnumMap[instance.status]!,
      'confidence': _$SignalConfidenceEnumMap[instance.confidence]!,
      'confidenceScore': instance.confidenceScore,
      'createdAt': instance.createdAt.toIso8601String(),
      'reasoning': instance.reasoning,
      'currentPrice': instance.currentPrice,
    };

const _$StrategyTypeEnumMap = {
  StrategyType.vwapTrendContinuation: 'vwapTrendContinuation',
  StrategyType.openingRangeBreakout: 'openingRangeBreakout',
  StrategyType.orderBlockRetest: 'orderBlockRetest',
  StrategyType.liquiditySweepReversal: 'liquiditySweepReversal',
  StrategyType.momentumBreakout: 'momentumBreakout',
};

const _$DirectionEnumMap = {
  Direction.bullish: 'bullish',
  Direction.bearish: 'bearish',
  Direction.neutral: 'neutral',
};

const _$TimeframeEnumMap = {
  Timeframe.m1: 'm1',
  Timeframe.m3: 'm3',
  Timeframe.m5: 'm5',
  Timeframe.m15: 'm15',
  Timeframe.m30: 'm30',
  Timeframe.h1: 'h1',
  Timeframe.d1: 'd1',
};

const _$SignalStatusEnumMap = {
  SignalStatus.active: 'active',
  SignalStatus.triggered: 'triggered',
  SignalStatus.targetReached: 'targetReached',
  SignalStatus.invalidated: 'invalidated',
  SignalStatus.expired: 'expired',
};

const _$SignalConfidenceEnumMap = {
  SignalConfidence.high: 'high',
  SignalConfidence.medium: 'medium',
  SignalConfidence.low: 'low',
};
