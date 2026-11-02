// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strategy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Strategy {

 StrategyType get type; String get description; int get activeCount; double get winRateHeuristic;
/// Create a copy of Strategy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StrategyCopyWith<Strategy> get copyWith => _$StrategyCopyWithImpl<Strategy>(this as Strategy, _$identity);

  /// Serializes this Strategy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Strategy;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Strategy&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.activeCount, _this.activeCount) || other.activeCount == _this.activeCount)&&(identical(other.winRateHeuristic, _this.winRateHeuristic) || other.winRateHeuristic == _this.winRateHeuristic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Strategy;
  return Object.hash(runtimeType,_this.type,_this.description,_this.activeCount,_this.winRateHeuristic);
}

@override
String toString() {
  final _this = this as Strategy;
  return 'Strategy(type: ${_this.type}, description: ${_this.description}, activeCount: ${_this.activeCount}, winRateHeuristic: ${_this.winRateHeuristic})';
}


}

/// @nodoc
abstract mixin class $StrategyCopyWith<$Res>  {
  factory $StrategyCopyWith(Strategy value, $Res Function(Strategy) _then) = _$StrategyCopyWithImpl;
@useResult
$Res call({
 StrategyType type, String description, int activeCount, double winRateHeuristic
});




}
/// @nodoc
class _$StrategyCopyWithImpl<$Res>
    implements $StrategyCopyWith<$Res> {
  _$StrategyCopyWithImpl(this._self, this._then);

  final Strategy _self;
  final $Res Function(Strategy) _then;

/// Create a copy of Strategy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? description = null,Object? activeCount = null,Object? winRateHeuristic = null,}) {
  return _then(Strategy(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StrategyType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,winRateHeuristic: null == winRateHeuristic ? _self.winRateHeuristic : winRateHeuristic // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Strategy].
extension StrategyPatterns on Strategy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Strategy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Strategy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Strategy value)  $default,){
final _that = this;
switch (_that) {
case _Strategy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Strategy value)?  $default,){
final _that = this;
switch (_that) {
case _Strategy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StrategyType type,  String description,  int activeCount,  double winRateHeuristic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Strategy() when $default != null:
return $default(_that.type,_that.description,_that.activeCount,_that.winRateHeuristic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StrategyType type,  String description,  int activeCount,  double winRateHeuristic)  $default,) {final _that = this;
switch (_that) {
case _Strategy():
return $default(_that.type,_that.description,_that.activeCount,_that.winRateHeuristic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StrategyType type,  String description,  int activeCount,  double winRateHeuristic)?  $default,) {final _that = this;
switch (_that) {
case _Strategy() when $default != null:
return $default(_that.type,_that.description,_that.activeCount,_that.winRateHeuristic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Strategy implements Strategy {
  const _Strategy({required this.type, required this.description, required this.activeCount, required this.winRateHeuristic});
  factory _Strategy.fromJson(Map<String, dynamic> json) => _$StrategyFromJson(json);

@override final  StrategyType type;
@override final  String description;
@override final  int activeCount;
@override final  double winRateHeuristic;

/// Create a copy of Strategy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StrategyCopyWith<_Strategy> get copyWith => __$StrategyCopyWithImpl<_Strategy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StrategyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Strategy&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.winRateHeuristic, winRateHeuristic) || other.winRateHeuristic == winRateHeuristic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,description,activeCount,winRateHeuristic);
}

@override
String toString() {
    return 'Strategy(type: $type, description: $description, activeCount: $activeCount, winRateHeuristic: $winRateHeuristic)';
}


}

/// @nodoc
abstract mixin class _$StrategyCopyWith<$Res> implements $StrategyCopyWith<$Res> {
  factory _$StrategyCopyWith(_Strategy value, $Res Function(_Strategy) _then) = __$StrategyCopyWithImpl;
@override @useResult
$Res call({
 StrategyType type, String description, int activeCount, double winRateHeuristic
});




}
/// @nodoc
class __$StrategyCopyWithImpl<$Res>
    implements _$StrategyCopyWith<$Res> {
  __$StrategyCopyWithImpl(this._self, this._then);

  final _Strategy _self;
  final $Res Function(_Strategy) _then;

/// Create a copy of Strategy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? description = null,Object? activeCount = null,Object? winRateHeuristic = null,}) {
  return _then(_Strategy(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StrategyType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,winRateHeuristic: null == winRateHeuristic ? _self.winRateHeuristic : winRateHeuristic // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
