// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stock _$StockFromJson(Map<String, dynamic> json) => _Stock(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  sector: json['sector'] as String,
  exchange: $enumDecode(_$ExchangeEnumMap, json['exchange']),
  ltp: (json['ltp'] as num).toDouble(),
  previousClose: (json['previousClose'] as num).toDouble(),
  dayHigh: (json['dayHigh'] as num).toDouble(),
  dayLow: (json['dayLow'] as num).toDouble(),
  open: (json['open'] as num).toDouble(),
  volume: (json['volume'] as num).toDouble(),
  avgVolume: (json['avgVolume'] as num).toDouble(),
  marketCap: (json['marketCap'] as num).toDouble(),
  strengthScore: (json['strengthScore'] as num).toDouble(),
  liquidityScore: (json['liquidityScore'] as num).toDouble(),
  vwap: (json['vwap'] as num).toDouble(),
  rank: (json['rank'] as num?)?.toInt() ?? 0,
  previousRank: (json['previousRank'] as num?)?.toInt() ?? 0,
  orderBlockStatus:
      $enumDecodeNullable(
        _$OrderBlockStatusEnumMap,
        json['orderBlockStatus'],
      ) ??
      OrderBlockStatus.none,
  isFno: json['isFno'] as bool? ?? true,
);

Map<String, dynamic> _$StockToJson(_Stock instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'sector': instance.sector,
  'exchange': _$ExchangeEnumMap[instance.exchange]!,
  'ltp': instance.ltp,
  'previousClose': instance.previousClose,
  'dayHigh': instance.dayHigh,
  'dayLow': instance.dayLow,
  'open': instance.open,
  'volume': instance.volume,
  'avgVolume': instance.avgVolume,
  'marketCap': instance.marketCap,
  'strengthScore': instance.strengthScore,
  'liquidityScore': instance.liquidityScore,
  'vwap': instance.vwap,
  'rank': instance.rank,
  'previousRank': instance.previousRank,
  'orderBlockStatus': _$OrderBlockStatusEnumMap[instance.orderBlockStatus]!,
  'isFno': instance.isFno,
};

const _$ExchangeEnumMap = {Exchange.nse: 'nse', Exchange.bse: 'bse'};

const _$OrderBlockStatusEnumMap = {
  OrderBlockStatus.active: 'active',
  OrderBlockStatus.mitigated: 'mitigated',
  OrderBlockStatus.none: 'none',
};
