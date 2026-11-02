// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Candle _$CandleFromJson(Map<String, dynamic> json) => _Candle(
  time: DateTime.parse(json['time'] as String),
  open: (json['open'] as num).toDouble(),
  high: (json['high'] as num).toDouble(),
  low: (json['low'] as num).toDouble(),
  close: (json['close'] as num).toDouble(),
  volume: (json['volume'] as num).toDouble(),
  vwap: (json['vwap'] as num?)?.toDouble(),
  ema9: (json['ema9'] as num?)?.toDouble(),
  ema21: (json['ema21'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CandleToJson(_Candle instance) => <String, dynamic>{
  'time': instance.time.toIso8601String(),
  'open': instance.open,
  'high': instance.high,
  'low': instance.low,
  'close': instance.close,
  'volume': instance.volume,
  'vwap': instance.vwap,
  'ema9': instance.ema9,
  'ema21': instance.ema21,
};
