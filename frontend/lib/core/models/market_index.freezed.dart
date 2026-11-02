// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketIndex {

 String get symbol; String get name; double get value; double get previousClose; bool get isVolatilityIndex;
/// Create a copy of MarketIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketIndexCopyWith<MarketIndex> get copyWith => _$MarketIndexCopyWithImpl<MarketIndex>(this as MarketIndex, _$identity);

  /// Serializes this MarketIndex to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketIndex;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketIndex&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.previousClose, _this.previousClose) || other.previousClose == _this.previousClose)&&(identical(other.isVolatilityIndex, _this.isVolatilityIndex) || other.isVolatilityIndex == _this.isVolatilityIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketIndex;
  return Object.hash(runtimeType,_this.symbol,_this.name,_this.value,_this.previousClose,_this.isVolatilityIndex);
}

@override
String toString() {
  final _this = this as MarketIndex;
  return 'MarketIndex(symbol: ${_this.symbol}, name: ${_this.name}, value: ${_this.value}, previousClose: ${_this.previousClose}, isVolatilityIndex: ${_this.isVolatilityIndex})';
}


}

/// @nodoc
abstract mixin class $MarketIndexCopyWith<$Res>  {
  factory $MarketIndexCopyWith(MarketIndex value, $Res Function(MarketIndex) _then) = _$MarketIndexCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, double value, double previousClose, bool isVolatilityIndex
});




}
/// @nodoc
class _$MarketIndexCopyWithImpl<$Res>
    implements $MarketIndexCopyWith<$Res> {
  _$MarketIndexCopyWithImpl(this._self, this._then);

  final MarketIndex _self;
  final $Res Function(MarketIndex) _then;

/// Create a copy of MarketIndex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? value = null,Object? previousClose = null,Object? isVolatilityIndex = null,}) {
  return _then(MarketIndex(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,isVolatilityIndex: null == isVolatilityIndex ? _self.isVolatilityIndex : isVolatilityIndex // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketIndex].
extension MarketIndexPatterns on MarketIndex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketIndex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketIndex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketIndex value)  $default,){
final _that = this;
switch (_that) {
case _MarketIndex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketIndex value)?  $default,){
final _that = this;
switch (_that) {
case _MarketIndex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  double value,  double previousClose,  bool isVolatilityIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketIndex() when $default != null:
return $default(_that.symbol,_that.name,_that.value,_that.previousClose,_that.isVolatilityIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  double value,  double previousClose,  bool isVolatilityIndex)  $default,) {final _that = this;
switch (_that) {
case _MarketIndex():
return $default(_that.symbol,_that.name,_that.value,_that.previousClose,_that.isVolatilityIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  double value,  double previousClose,  bool isVolatilityIndex)?  $default,) {final _that = this;
switch (_that) {
case _MarketIndex() when $default != null:
return $default(_that.symbol,_that.name,_that.value,_that.previousClose,_that.isVolatilityIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketIndex extends MarketIndex {
  const _MarketIndex({required this.symbol, required this.name, required this.value, required this.previousClose, this.isVolatilityIndex = false}): super._();
  factory _MarketIndex.fromJson(Map<String, dynamic> json) => _$MarketIndexFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  double value;
@override final  double previousClose;
@override@JsonKey() final  bool isVolatilityIndex;

/// Create a copy of MarketIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketIndexCopyWith<_MarketIndex> get copyWith => __$MarketIndexCopyWithImpl<_MarketIndex>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketIndexToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketIndex&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.isVolatilityIndex, isVolatilityIndex) || other.isVolatilityIndex == isVolatilityIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,symbol,name,value,previousClose,isVolatilityIndex);
}

@override
String toString() {
    return 'MarketIndex(symbol: $symbol, name: $name, value: $value, previousClose: $previousClose, isVolatilityIndex: $isVolatilityIndex)';
}


}

/// @nodoc
abstract mixin class _$MarketIndexCopyWith<$Res> implements $MarketIndexCopyWith<$Res> {
  factory _$MarketIndexCopyWith(_MarketIndex value, $Res Function(_MarketIndex) _then) = __$MarketIndexCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, double value, double previousClose, bool isVolatilityIndex
});




}
/// @nodoc
class __$MarketIndexCopyWithImpl<$Res>
    implements _$MarketIndexCopyWith<$Res> {
  __$MarketIndexCopyWithImpl(this._self, this._then);

  final _MarketIndex _self;
  final $Res Function(_MarketIndex) _then;

/// Create a copy of MarketIndex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? value = null,Object? previousClose = null,Object? isVolatilityIndex = null,}) {
  return _then(_MarketIndex(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,isVolatilityIndex: null == isVolatilityIndex ? _self.isVolatilityIndex : isVolatilityIndex // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
