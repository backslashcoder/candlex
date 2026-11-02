// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquidity_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiquidityLevel {

 double get price; String get label; bool get isResistance; bool get isSwing;
/// Create a copy of LiquidityLevel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiquidityLevelCopyWith<LiquidityLevel> get copyWith => _$LiquidityLevelCopyWithImpl<LiquidityLevel>(this as LiquidityLevel, _$identity);

  /// Serializes this LiquidityLevel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LiquidityLevel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiquidityLevel&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.isResistance, _this.isResistance) || other.isResistance == _this.isResistance)&&(identical(other.isSwing, _this.isSwing) || other.isSwing == _this.isSwing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LiquidityLevel;
  return Object.hash(runtimeType,_this.price,_this.label,_this.isResistance,_this.isSwing);
}

@override
String toString() {
  final _this = this as LiquidityLevel;
  return 'LiquidityLevel(price: ${_this.price}, label: ${_this.label}, isResistance: ${_this.isResistance}, isSwing: ${_this.isSwing})';
}


}

/// @nodoc
abstract mixin class $LiquidityLevelCopyWith<$Res>  {
  factory $LiquidityLevelCopyWith(LiquidityLevel value, $Res Function(LiquidityLevel) _then) = _$LiquidityLevelCopyWithImpl;
@useResult
$Res call({
 double price, String label, bool isResistance, bool isSwing
});




}
/// @nodoc
class _$LiquidityLevelCopyWithImpl<$Res>
    implements $LiquidityLevelCopyWith<$Res> {
  _$LiquidityLevelCopyWithImpl(this._self, this._then);

  final LiquidityLevel _self;
  final $Res Function(LiquidityLevel) _then;

/// Create a copy of LiquidityLevel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? label = null,Object? isResistance = null,Object? isSwing = null,}) {
  return _then(LiquidityLevel(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isResistance: null == isResistance ? _self.isResistance : isResistance // ignore: cast_nullable_to_non_nullable
as bool,isSwing: null == isSwing ? _self.isSwing : isSwing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LiquidityLevel].
extension LiquidityLevelPatterns on LiquidityLevel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiquidityLevel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiquidityLevel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiquidityLevel value)  $default,){
final _that = this;
switch (_that) {
case _LiquidityLevel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiquidityLevel value)?  $default,){
final _that = this;
switch (_that) {
case _LiquidityLevel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  String label,  bool isResistance,  bool isSwing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiquidityLevel() when $default != null:
return $default(_that.price,_that.label,_that.isResistance,_that.isSwing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  String label,  bool isResistance,  bool isSwing)  $default,) {final _that = this;
switch (_that) {
case _LiquidityLevel():
return $default(_that.price,_that.label,_that.isResistance,_that.isSwing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  String label,  bool isResistance,  bool isSwing)?  $default,) {final _that = this;
switch (_that) {
case _LiquidityLevel() when $default != null:
return $default(_that.price,_that.label,_that.isResistance,_that.isSwing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiquidityLevel implements LiquidityLevel {
  const _LiquidityLevel({required this.price, required this.label, this.isResistance = false, this.isSwing = false});
  factory _LiquidityLevel.fromJson(Map<String, dynamic> json) => _$LiquidityLevelFromJson(json);

@override final  double price;
@override final  String label;
@override@JsonKey() final  bool isResistance;
@override@JsonKey() final  bool isSwing;

/// Create a copy of LiquidityLevel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiquidityLevelCopyWith<_LiquidityLevel> get copyWith => __$LiquidityLevelCopyWithImpl<_LiquidityLevel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiquidityLevelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiquidityLevel&&(identical(other.price, price) || other.price == price)&&(identical(other.label, label) || other.label == label)&&(identical(other.isResistance, isResistance) || other.isResistance == isResistance)&&(identical(other.isSwing, isSwing) || other.isSwing == isSwing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,price,label,isResistance,isSwing);
}

@override
String toString() {
    return 'LiquidityLevel(price: $price, label: $label, isResistance: $isResistance, isSwing: $isSwing)';
}


}

/// @nodoc
abstract mixin class _$LiquidityLevelCopyWith<$Res> implements $LiquidityLevelCopyWith<$Res> {
  factory _$LiquidityLevelCopyWith(_LiquidityLevel value, $Res Function(_LiquidityLevel) _then) = __$LiquidityLevelCopyWithImpl;
@override @useResult
$Res call({
 double price, String label, bool isResistance, bool isSwing
});




}
/// @nodoc
class __$LiquidityLevelCopyWithImpl<$Res>
    implements _$LiquidityLevelCopyWith<$Res> {
  __$LiquidityLevelCopyWithImpl(this._self, this._then);

  final _LiquidityLevel _self;
  final $Res Function(_LiquidityLevel) _then;

/// Create a copy of LiquidityLevel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? label = null,Object? isResistance = null,Object? isSwing = null,}) {
  return _then(_LiquidityLevel(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isResistance: null == isResistance ? _self.isResistance : isResistance // ignore: cast_nullable_to_non_nullable
as bool,isSwing: null == isSwing ? _self.isSwing : isSwing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
