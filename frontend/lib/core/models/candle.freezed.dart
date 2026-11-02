// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Candle {

 DateTime get time; double get open; double get high; double get low; double get close; double get volume; double? get vwap; double? get ema9; double? get ema21;
/// Create a copy of Candle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandleCopyWith<Candle> get copyWith => _$CandleCopyWithImpl<Candle>(this as Candle, _$identity);

  /// Serializes this Candle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Candle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Candle&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.open, _this.open) || other.open == _this.open)&&(identical(other.high, _this.high) || other.high == _this.high)&&(identical(other.low, _this.low) || other.low == _this.low)&&(identical(other.close, _this.close) || other.close == _this.close)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.vwap, _this.vwap) || other.vwap == _this.vwap)&&(identical(other.ema9, _this.ema9) || other.ema9 == _this.ema9)&&(identical(other.ema21, _this.ema21) || other.ema21 == _this.ema21));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Candle;
  return Object.hash(runtimeType,_this.time,_this.open,_this.high,_this.low,_this.close,_this.volume,_this.vwap,_this.ema9,_this.ema21);
}

@override
String toString() {
  final _this = this as Candle;
  return 'Candle(time: ${_this.time}, open: ${_this.open}, high: ${_this.high}, low: ${_this.low}, close: ${_this.close}, volume: ${_this.volume}, vwap: ${_this.vwap}, ema9: ${_this.ema9}, ema21: ${_this.ema21})';
}


}

/// @nodoc
abstract mixin class $CandleCopyWith<$Res>  {
  factory $CandleCopyWith(Candle value, $Res Function(Candle) _then) = _$CandleCopyWithImpl;
@useResult
$Res call({
 DateTime time, double open, double high, double low, double close, double volume, double? vwap, double? ema9, double? ema21
});




}
/// @nodoc
class _$CandleCopyWithImpl<$Res>
    implements $CandleCopyWith<$Res> {
  _$CandleCopyWithImpl(this._self, this._then);

  final Candle _self;
  final $Res Function(Candle) _then;

/// Create a copy of Candle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,Object? vwap = freezed,Object? ema9 = freezed,Object? ema21 = freezed,}) {
  return _then(Candle(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,vwap: freezed == vwap ? _self.vwap : vwap // ignore: cast_nullable_to_non_nullable
as double?,ema9: freezed == ema9 ? _self.ema9 : ema9 // ignore: cast_nullable_to_non_nullable
as double?,ema21: freezed == ema21 ? _self.ema21 : ema21 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Candle].
extension CandlePatterns on Candle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Candle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Candle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Candle value)  $default,){
final _that = this;
switch (_that) {
case _Candle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Candle value)?  $default,){
final _that = this;
switch (_that) {
case _Candle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  double open,  double high,  double low,  double close,  double volume,  double? vwap,  double? ema9,  double? ema21)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Candle() when $default != null:
return $default(_that.time,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.vwap,_that.ema9,_that.ema21);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  double open,  double high,  double low,  double close,  double volume,  double? vwap,  double? ema9,  double? ema21)  $default,) {final _that = this;
switch (_that) {
case _Candle():
return $default(_that.time,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.vwap,_that.ema9,_that.ema21);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  double open,  double high,  double low,  double close,  double volume,  double? vwap,  double? ema9,  double? ema21)?  $default,) {final _that = this;
switch (_that) {
case _Candle() when $default != null:
return $default(_that.time,_that.open,_that.high,_that.low,_that.close,_that.volume,_that.vwap,_that.ema9,_that.ema21);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Candle extends Candle {
  const _Candle({required this.time, required this.open, required this.high, required this.low, required this.close, required this.volume, this.vwap, this.ema9, this.ema21}): super._();
  factory _Candle.fromJson(Map<String, dynamic> json) => _$CandleFromJson(json);

@override final  DateTime time;
@override final  double open;
@override final  double high;
@override final  double low;
@override final  double close;
@override final  double volume;
@override final  double? vwap;
@override final  double? ema9;
@override final  double? ema21;

/// Create a copy of Candle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandleCopyWith<_Candle> get copyWith => __$CandleCopyWithImpl<_Candle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Candle&&(identical(other.time, time) || other.time == time)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.vwap, vwap) || other.vwap == vwap)&&(identical(other.ema9, ema9) || other.ema9 == ema9)&&(identical(other.ema21, ema21) || other.ema21 == ema21));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,time,open,high,low,close,volume,vwap,ema9,ema21);
}

@override
String toString() {
    return 'Candle(time: $time, open: $open, high: $high, low: $low, close: $close, volume: $volume, vwap: $vwap, ema9: $ema9, ema21: $ema21)';
}


}

/// @nodoc
abstract mixin class _$CandleCopyWith<$Res> implements $CandleCopyWith<$Res> {
  factory _$CandleCopyWith(_Candle value, $Res Function(_Candle) _then) = __$CandleCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, double open, double high, double low, double close, double volume, double? vwap, double? ema9, double? ema21
});




}
/// @nodoc
class __$CandleCopyWithImpl<$Res>
    implements _$CandleCopyWith<$Res> {
  __$CandleCopyWithImpl(this._self, this._then);

  final _Candle _self;
  final $Res Function(_Candle) _then;

/// Create a copy of Candle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? volume = null,Object? vwap = freezed,Object? ema9 = freezed,Object? ema21 = freezed,}) {
  return _then(_Candle(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,vwap: freezed == vwap ? _self.vwap : vwap // ignore: cast_nullable_to_non_nullable
as double?,ema9: freezed == ema9 ? _self.ema9 : ema9 // ignore: cast_nullable_to_non_nullable
as double?,ema21: freezed == ema21 ? _self.ema21 : ema21 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
