// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketIndex _$MarketIndexFromJson(Map<String, dynamic> json) => _MarketIndex(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  value: (json['value'] as num).toDouble(),
  previousClose: (json['previousClose'] as num).toDouble(),
  isVolatilityIndex: json['isVolatilityIndex'] as bool? ?? false,
);

Map<String, dynamic> _$MarketIndexToJson(_MarketIndex instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'value': instance.value,
      'previousClose': instance.previousClose,
      'isVolatilityIndex': instance.isVolatilityIndex,
    };
