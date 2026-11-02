// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderBlock {

 OrderBlockKind get kind; double get top; double get bottom; DateTime get from; bool get active; String get label;
/// Create a copy of OrderBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderBlockCopyWith<OrderBlock> get copyWith => _$OrderBlockCopyWithImpl<OrderBlock>(this as OrderBlock, _$identity);

  /// Serializes this OrderBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderBlock&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.top, _this.top) || other.top == _this.top)&&(identical(other.bottom, _this.bottom) || other.bottom == _this.bottom)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderBlock;
  return Object.hash(runtimeType,_this.kind,_this.top,_this.bottom,_this.from,_this.active,_this.label);
}

@override
String toString() {
  final _this = this as OrderBlock;
  return 'OrderBlock(kind: ${_this.kind}, top: ${_this.top}, bottom: ${_this.bottom}, from: ${_this.from}, active: ${_this.active}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $OrderBlockCopyWith<$Res>  {
  factory $OrderBlockCopyWith(OrderBlock value, $Res Function(OrderBlock) _then) = _$OrderBlockCopyWithImpl;
@useResult
$Res call({
 OrderBlockKind kind, double top, double bottom, DateTime from, bool active, String label
});




}
/// @nodoc
class _$OrderBlockCopyWithImpl<$Res>
    implements $OrderBlockCopyWith<$Res> {
  _$OrderBlockCopyWithImpl(this._self, this._then);

  final OrderBlock _self;
  final $Res Function(OrderBlock) _then;

/// Create a copy of OrderBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? top = null,Object? bottom = null,Object? from = null,Object? active = null,Object? label = null,}) {
  return _then(OrderBlock(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OrderBlockKind,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderBlock].
extension OrderBlockPatterns on OrderBlock {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderBlock() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderBlock value)  $default,){
final _that = this;
switch (_that) {
case _OrderBlock():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderBlock value)?  $default,){
final _that = this;
switch (_that) {
case _OrderBlock() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderBlockKind kind,  double top,  double bottom,  DateTime from,  bool active,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderBlock() when $default != null:
return $default(_that.kind,_that.top,_that.bottom,_that.from,_that.active,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderBlockKind kind,  double top,  double bottom,  DateTime from,  bool active,  String label)  $default,) {final _that = this;
switch (_that) {
case _OrderBlock():
return $default(_that.kind,_that.top,_that.bottom,_that.from,_that.active,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderBlockKind kind,  double top,  double bottom,  DateTime from,  bool active,  String label)?  $default,) {final _that = this;
switch (_that) {
case _OrderBlock() when $default != null:
return $default(_that.kind,_that.top,_that.bottom,_that.from,_that.active,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderBlock implements OrderBlock {
  const _OrderBlock({required this.kind, required this.top, required this.bottom, required this.from, this.active = true, this.label = ''});
  factory _OrderBlock.fromJson(Map<String, dynamic> json) => _$OrderBlockFromJson(json);

@override final  OrderBlockKind kind;
@override final  double top;
@override final  double bottom;
@override final  DateTime from;
@override@JsonKey() final  bool active;
@override@JsonKey() final  String label;

/// Create a copy of OrderBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderBlockCopyWith<_OrderBlock> get copyWith => __$OrderBlockCopyWithImpl<_OrderBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderBlock&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom)&&(identical(other.from, from) || other.from == from)&&(identical(other.active, active) || other.active == active)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,top,bottom,from,active,label);
}

@override
String toString() {
    return 'OrderBlock(kind: $kind, top: $top, bottom: $bottom, from: $from, active: $active, label: $label)';
}


}

/// @nodoc
abstract mixin class _$OrderBlockCopyWith<$Res> implements $OrderBlockCopyWith<$Res> {
  factory _$OrderBlockCopyWith(_OrderBlock value, $Res Function(_OrderBlock) _then) = __$OrderBlockCopyWithImpl;
@override @useResult
$Res call({
 OrderBlockKind kind, double top, double bottom, DateTime from, bool active, String label
});




}
/// @nodoc
class __$OrderBlockCopyWithImpl<$Res>
    implements _$OrderBlockCopyWith<$Res> {
  __$OrderBlockCopyWithImpl(this._self, this._then);

  final _OrderBlock _self;
  final $Res Function(_OrderBlock) _then;

/// Create a copy of OrderBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? top = null,Object? bottom = null,Object? from = null,Object? active = null,Object? label = null,}) {
  return _then(_OrderBlock(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OrderBlockKind,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
