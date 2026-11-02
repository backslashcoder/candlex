// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Watchlist _$WatchlistFromJson(Map<String, dynamic> json) => _Watchlist(
  id: json['id'] as String,
  name: json['name'] as String,
  symbols: (json['symbols'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$WatchlistToJson(_Watchlist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbols': instance.symbols,
    };
