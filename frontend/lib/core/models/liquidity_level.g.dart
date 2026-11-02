// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquidity_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiquidityLevel _$LiquidityLevelFromJson(Map<String, dynamic> json) =>
    _LiquidityLevel(
      price: (json['price'] as num).toDouble(),
      label: json['label'] as String,
      isResistance: json['isResistance'] as bool? ?? false,
      isSwing: json['isSwing'] as bool? ?? false,
    );

Map<String, dynamic> _$LiquidityLevelToJson(_LiquidityLevel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'label': instance.label,
      'isResistance': instance.isResistance,
      'isSwing': instance.isSwing,
    };
