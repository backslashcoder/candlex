// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderBlock _$OrderBlockFromJson(Map<String, dynamic> json) => _OrderBlock(
  kind: $enumDecode(_$OrderBlockKindEnumMap, json['kind']),
  top: (json['top'] as num).toDouble(),
  bottom: (json['bottom'] as num).toDouble(),
  from: DateTime.parse(json['from'] as String),
  active: json['active'] as bool? ?? true,
  label: json['label'] as String? ?? '',
);

Map<String, dynamic> _$OrderBlockToJson(_OrderBlock instance) =>
    <String, dynamic>{
      'kind': _$OrderBlockKindEnumMap[instance.kind]!,
      'top': instance.top,
      'bottom': instance.bottom,
      'from': instance.from.toIso8601String(),
      'active': instance.active,
      'label': instance.label,
    };

const _$OrderBlockKindEnumMap = {
  OrderBlockKind.bullish: 'bullish',
  OrderBlockKind.bearish: 'bearish',
};
