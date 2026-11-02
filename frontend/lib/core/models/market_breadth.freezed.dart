// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_breadth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketBreadth {

 int get advances; int get declines; int get unchanged; int get newHighs; int get newLows; int get aboveVwap; int get belowVwap; List<int> get strengthDistribution;
/// Create a copy of MarketBreadth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketBreadthCopyWith<MarketBreadth> get copyWith => _$MarketBreadthCopyWithImpl<MarketBreadth>(this as MarketBreadth, _$identity);

  /// Serializes this MarketBreadth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketBreadth;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketBreadth&&(identical(other.advances, _this.advances) || other.advances == _this.advances)&&(identical(other.declines, _this.declines) || other.declines == _this.declines)&&(identical(other.unchanged, _this.unchanged) || other.unchanged == _this.unchanged)&&(identical(other.newHighs, _this.newHighs) || other.newHighs == _this.newHighs)&&(identical(other.newLows, _this.newLows) || other.newLows == _this.newLows)&&(identical(other.aboveVwap, _this.aboveVwap) || other.aboveVwap == _this.aboveVwap)&&(identical(other.belowVwap, _this.belowVwap) || other.belowVwap == _this.belowVwap)&&const DeepCollectionEquality().equals(other.strengthDistribution, _this.strengthDistribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketBreadth;
  return Object.hash(runtimeType,_this.advances,_this.declines,_this.unchanged,_this.newHighs,_this.newLows,_this.aboveVwap,_this.belowVwap,const DeepCollectionEquality().hash(_this.strengthDistribution));
}

@override
String toString() {
  final _this = this as MarketBreadth;
  return 'MarketBreadth(advances: ${_this.advances}, declines: ${_this.declines}, unchanged: ${_this.unchanged}, newHighs: ${_this.newHighs}, newLows: ${_this.newLows}, aboveVwap: ${_this.aboveVwap}, belowVwap: ${_this.belowVwap}, strengthDistribution: ${_this.strengthDistribution})';
}


}

/// @nodoc
abstract mixin class $MarketBreadthCopyWith<$Res>  {
  factory $MarketBreadthCopyWith(MarketBreadth value, $Res Function(MarketBreadth) _then) = _$MarketBreadthCopyWithImpl;
@useResult
$Res call({
 int advances, int declines, int unchanged, int newHighs, int newLows, int aboveVwap, int belowVwap, List<int> strengthDistribution
});




}
/// @nodoc
class _$MarketBreadthCopyWithImpl<$Res>
    implements $MarketBreadthCopyWith<$Res> {
  _$MarketBreadthCopyWithImpl(this._self, this._then);

  final MarketBreadth _self;
  final $Res Function(MarketBreadth) _then;

/// Create a copy of MarketBreadth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? advances = null,Object? declines = null,Object? unchanged = null,Object? newHighs = null,Object? newLows = null,Object? aboveVwap = null,Object? belowVwap = null,Object? strengthDistribution = null,}) {
  return _then(MarketBreadth(
advances: null == advances ? _self.advances : advances // ignore: cast_nullable_to_non_nullable
as int,declines: null == declines ? _self.declines : declines // ignore: cast_nullable_to_non_nullable
as int,unchanged: null == unchanged ? _self.unchanged : unchanged // ignore: cast_nullable_to_non_nullable
as int,newHighs: null == newHighs ? _self.newHighs : newHighs // ignore: cast_nullable_to_non_nullable
as int,newLows: null == newLows ? _self.newLows : newLows // ignore: cast_nullable_to_non_nullable
as int,aboveVwap: null == aboveVwap ? _self.aboveVwap : aboveVwap // ignore: cast_nullable_to_non_nullable
as int,belowVwap: null == belowVwap ? _self.belowVwap : belowVwap // ignore: cast_nullable_to_non_nullable
as int,strengthDistribution: null == strengthDistribution ? _self.strengthDistribution : strengthDistribution // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketBreadth].
extension MarketBreadthPatterns on MarketBreadth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketBreadth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketBreadth() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketBreadth value)  $default,){
final _that = this;
switch (_that) {
case _MarketBreadth():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketBreadth value)?  $default,){
final _that = this;
switch (_that) {
case _MarketBreadth() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int advances,  int declines,  int unchanged,  int newHighs,  int newLows,  int aboveVwap,  int belowVwap,  List<int> strengthDistribution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketBreadth() when $default != null:
return $default(_that.advances,_that.declines,_that.unchanged,_that.newHighs,_that.newLows,_that.aboveVwap,_that.belowVwap,_that.strengthDistribution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int advances,  int declines,  int unchanged,  int newHighs,  int newLows,  int aboveVwap,  int belowVwap,  List<int> strengthDistribution)  $default,) {final _that = this;
switch (_that) {
case _MarketBreadth():
return $default(_that.advances,_that.declines,_that.unchanged,_that.newHighs,_that.newLows,_that.aboveVwap,_that.belowVwap,_that.strengthDistribution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int advances,  int declines,  int unchanged,  int newHighs,  int newLows,  int aboveVwap,  int belowVwap,  List<int> strengthDistribution)?  $default,) {final _that = this;
switch (_that) {
case _MarketBreadth() when $default != null:
return $default(_that.advances,_that.declines,_that.unchanged,_that.newHighs,_that.newLows,_that.aboveVwap,_that.belowVwap,_that.strengthDistribution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketBreadth extends MarketBreadth {
  const _MarketBreadth({required this.advances, required this.declines, required this.unchanged, required this.newHighs, required this.newLows, required this.aboveVwap, required this.belowVwap,  List<int> strengthDistribution = const <int>[]}): _strengthDistribution = strengthDistribution,super._();
  factory _MarketBreadth.fromJson(Map<String, dynamic> json) => _$MarketBreadthFromJson(json);

@override final  int advances;
@override final  int declines;
@override final  int unchanged;
@override final  int newHighs;
@override final  int newLows;
@override final  int aboveVwap;
@override final  int belowVwap;
 final  List<int> _strengthDistribution;
@override@JsonKey() List<int> get strengthDistribution {
  if (_strengthDistribution is EqualUnmodifiableListView) return _strengthDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengthDistribution);
}


/// Create a copy of MarketBreadth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketBreadthCopyWith<_MarketBreadth> get copyWith => __$MarketBreadthCopyWithImpl<_MarketBreadth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketBreadthToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketBreadth&&(identical(other.advances, advances) || other.advances == advances)&&(identical(other.declines, declines) || other.declines == declines)&&(identical(other.unchanged, unchanged) || other.unchanged == unchanged)&&(identical(other.newHighs, newHighs) || other.newHighs == newHighs)&&(identical(other.newLows, newLows) || other.newLows == newLows)&&(identical(other.aboveVwap, aboveVwap) || other.aboveVwap == aboveVwap)&&(identical(other.belowVwap, belowVwap) || other.belowVwap == belowVwap)&&const DeepCollectionEquality().equals(other.strengthDistribution, _strengthDistribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,advances,declines,unchanged,newHighs,newLows,aboveVwap,belowVwap,const DeepCollectionEquality().hash(_strengthDistribution));
}

@override
String toString() {
    return 'MarketBreadth(advances: $advances, declines: $declines, unchanged: $unchanged, newHighs: $newHighs, newLows: $newLows, aboveVwap: $aboveVwap, belowVwap: $belowVwap, strengthDistribution: $strengthDistribution)';
}


}

/// @nodoc
abstract mixin class _$MarketBreadthCopyWith<$Res> implements $MarketBreadthCopyWith<$Res> {
  factory _$MarketBreadthCopyWith(_MarketBreadth value, $Res Function(_MarketBreadth) _then) = __$MarketBreadthCopyWithImpl;
@override @useResult
$Res call({
 int advances, int declines, int unchanged, int newHighs, int newLows, int aboveVwap, int belowVwap, List<int> strengthDistribution
});




}
/// @nodoc
class __$MarketBreadthCopyWithImpl<$Res>
    implements _$MarketBreadthCopyWith<$Res> {
  __$MarketBreadthCopyWithImpl(this._self, this._then);

  final _MarketBreadth _self;
  final $Res Function(_MarketBreadth) _then;

/// Create a copy of MarketBreadth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? advances = null,Object? declines = null,Object? unchanged = null,Object? newHighs = null,Object? newLows = null,Object? aboveVwap = null,Object? belowVwap = null,Object? strengthDistribution = null,}) {
  return _then(_MarketBreadth(
advances: null == advances ? _self.advances : advances // ignore: cast_nullable_to_non_nullable
as int,declines: null == declines ? _self.declines : declines // ignore: cast_nullable_to_non_nullable
as int,unchanged: null == unchanged ? _self.unchanged : unchanged // ignore: cast_nullable_to_non_nullable
as int,newHighs: null == newHighs ? _self.newHighs : newHighs // ignore: cast_nullable_to_non_nullable
as int,newLows: null == newLows ? _self.newLows : newLows // ignore: cast_nullable_to_non_nullable
as int,aboveVwap: null == aboveVwap ? _self.aboveVwap : aboveVwap // ignore: cast_nullable_to_non_nullable
as int,belowVwap: null == belowVwap ? _self.belowVwap : belowVwap // ignore: cast_nullable_to_non_nullable
as int,strengthDistribution: null == strengthDistribution ? _self._strengthDistribution : strengthDistribution // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
