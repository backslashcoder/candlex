import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'order_block.freezed.dart';
part 'order_block.g.dart';

/// A supply/demand zone drawn on the chart between [top] and [bottom].
@freezed
abstract class OrderBlock with _$OrderBlock {
  const factory OrderBlock({
    required OrderBlockKind kind,
    required double top,
    required double bottom,
    required DateTime from,
    @Default(true) bool active,
    @Default('') String label,
  }) = _OrderBlock;

  factory OrderBlock.fromJson(Map<String, dynamic> json) =>
      _$OrderBlockFromJson(json);
}
