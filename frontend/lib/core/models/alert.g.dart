// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Alert _$AlertFromJson(Map<String, dynamic> json) => _Alert(
  id: json['id'] as String,
  kind: $enumDecode(_$AlertKindEnumMap, json['kind']),
  symbol: json['symbol'] as String,
  message: json['message'] as String,
  time: DateTime.parse(json['time'] as String),
  direction: $enumDecode(_$DirectionEnumMap, json['direction']),
  delivered: json['delivered'] as bool? ?? false,
);

Map<String, dynamic> _$AlertToJson(_Alert instance) => <String, dynamic>{
  'id': instance.id,
  'kind': _$AlertKindEnumMap[instance.kind]!,
  'symbol': instance.symbol,
  'message': instance.message,
  'time': instance.time.toIso8601String(),
  'direction': _$DirectionEnumMap[instance.direction]!,
  'delivered': instance.delivered,
};

const _$AlertKindEnumMap = {
  AlertKind.bullishSignal: 'bullishSignal',
  AlertKind.bearishSignal: 'bearishSignal',
  AlertKind.entryTrigger: 'entryTrigger',
  AlertKind.targetUpdate: 'targetUpdate',
  AlertKind.invalidation: 'invalidation',
  AlertKind.dailySummary: 'dailySummary',
};

const _$DirectionEnumMap = {
  Direction.bullish: 'bullish',
  Direction.bearish: 'bearish',
  Direction.neutral: 'neutral',
};
