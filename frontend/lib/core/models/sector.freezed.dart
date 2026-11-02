// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SectorPerformance {

 String get name; double get avgChangePercent; int get bullishCount; int get bearishCount; double get relativeStrength; int get rank; int get previousRank; List<String> get topBullish; List<String> get topBearish;
/// Create a copy of SectorPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectorPerformanceCopyWith<SectorPerformance> get copyWith => _$SectorPerformanceCopyWithImpl<SectorPerformance>(this as SectorPerformance, _$identity);

  /// Serializes this SectorPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SectorPerformance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectorPerformance&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.avgChangePercent, _this.avgChangePercent) || other.avgChangePercent == _this.avgChangePercent)&&(identical(other.bullishCount, _this.bullishCount) || other.bullishCount == _this.bullishCount)&&(identical(other.bearishCount, _this.bearishCount) || other.bearishCount == _this.bearishCount)&&(identical(other.relativeStrength, _this.relativeStrength) || other.relativeStrength == _this.relativeStrength)&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&(identical(other.previousRank, _this.previousRank) || other.previousRank == _this.previousRank)&&const DeepCollectionEquality().equals(other.topBullish, _this.topBullish)&&const DeepCollectionEquality().equals(other.topBearish, _this.topBearish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SectorPerformance;
  return Object.hash(runtimeType,_this.name,_this.avgChangePercent,_this.bullishCount,_this.bearishCount,_this.relativeStrength,_this.rank,_this.previousRank,const DeepCollectionEquality().hash(_this.topBullish),const DeepCollectionEquality().hash(_this.topBearish));
}

@override
String toString() {
  final _this = this as SectorPerformance;
  return 'SectorPerformance(name: ${_this.name}, avgChangePercent: ${_this.avgChangePercent}, bullishCount: ${_this.bullishCount}, bearishCount: ${_this.bearishCount}, relativeStrength: ${_this.relativeStrength}, rank: ${_this.rank}, previousRank: ${_this.previousRank}, topBullish: ${_this.topBullish}, topBearish: ${_this.topBearish})';
}


}

/// @nodoc
abstract mixin class $SectorPerformanceCopyWith<$Res>  {
  factory $SectorPerformanceCopyWith(SectorPerformance value, $Res Function(SectorPerformance) _then) = _$SectorPerformanceCopyWithImpl;
@useResult
$Res call({
 String name, double avgChangePercent, int bullishCount, int bearishCount, double relativeStrength, int rank, int previousRank, List<String> topBullish, List<String> topBearish
});




}
/// @nodoc
class _$SectorPerformanceCopyWithImpl<$Res>
    implements $SectorPerformanceCopyWith<$Res> {
  _$SectorPerformanceCopyWithImpl(this._self, this._then);

  final SectorPerformance _self;
  final $Res Function(SectorPerformance) _then;

/// Create a copy of SectorPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? avgChangePercent = null,Object? bullishCount = null,Object? bearishCount = null,Object? relativeStrength = null,Object? rank = null,Object? previousRank = null,Object? topBullish = null,Object? topBearish = null,}) {
  return _then(SectorPerformance(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avgChangePercent: null == avgChangePercent ? _self.avgChangePercent : avgChangePercent // ignore: cast_nullable_to_non_nullable
as double,bullishCount: null == bullishCount ? _self.bullishCount : bullishCount // ignore: cast_nullable_to_non_nullable
as int,bearishCount: null == bearishCount ? _self.bearishCount : bearishCount // ignore: cast_nullable_to_non_nullable
as int,relativeStrength: null == relativeStrength ? _self.relativeStrength : relativeStrength // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,topBullish: null == topBullish ? _self.topBullish : topBullish // ignore: cast_nullable_to_non_nullable
as List<String>,topBearish: null == topBearish ? _self.topBearish : topBearish // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SectorPerformance].
extension SectorPerformancePatterns on SectorPerformance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectorPerformance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectorPerformance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectorPerformance value)  $default,){
final _that = this;
switch (_that) {
case _SectorPerformance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectorPerformance value)?  $default,){
final _that = this;
switch (_that) {
case _SectorPerformance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double avgChangePercent,  int bullishCount,  int bearishCount,  double relativeStrength,  int rank,  int previousRank,  List<String> topBullish,  List<String> topBearish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectorPerformance() when $default != null:
return $default(_that.name,_that.avgChangePercent,_that.bullishCount,_that.bearishCount,_that.relativeStrength,_that.rank,_that.previousRank,_that.topBullish,_that.topBearish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double avgChangePercent,  int bullishCount,  int bearishCount,  double relativeStrength,  int rank,  int previousRank,  List<String> topBullish,  List<String> topBearish)  $default,) {final _that = this;
switch (_that) {
case _SectorPerformance():
return $default(_that.name,_that.avgChangePercent,_that.bullishCount,_that.bearishCount,_that.relativeStrength,_that.rank,_that.previousRank,_that.topBullish,_that.topBearish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double avgChangePercent,  int bullishCount,  int bearishCount,  double relativeStrength,  int rank,  int previousRank,  List<String> topBullish,  List<String> topBearish)?  $default,) {final _that = this;
switch (_that) {
case _SectorPerformance() when $default != null:
return $default(_that.name,_that.avgChangePercent,_that.bullishCount,_that.bearishCount,_that.relativeStrength,_that.rank,_that.previousRank,_that.topBullish,_that.topBearish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectorPerformance extends SectorPerformance {
  const _SectorPerformance({required this.name, required this.avgChangePercent, required this.bullishCount, required this.bearishCount, required this.relativeStrength, required this.rank, this.previousRank = 0,  List<String> topBullish = const <String>[],  List<String> topBearish = const <String>[]}): _topBullish = topBullish,_topBearish = topBearish,super._();
  factory _SectorPerformance.fromJson(Map<String, dynamic> json) => _$SectorPerformanceFromJson(json);

@override final  String name;
@override final  double avgChangePercent;
@override final  int bullishCount;
@override final  int bearishCount;
@override final  double relativeStrength;
@override final  int rank;
@override@JsonKey() final  int previousRank;
 final  List<String> _topBullish;
@override@JsonKey() List<String> get topBullish {
  if (_topBullish is EqualUnmodifiableListView) return _topBullish;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topBullish);
}

 final  List<String> _topBearish;
@override@JsonKey() List<String> get topBearish {
  if (_topBearish is EqualUnmodifiableListView) return _topBearish;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topBearish);
}


/// Create a copy of SectorPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectorPerformanceCopyWith<_SectorPerformance> get copyWith => __$SectorPerformanceCopyWithImpl<_SectorPerformance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectorPerformanceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectorPerformance&&(identical(other.name, name) || other.name == name)&&(identical(other.avgChangePercent, avgChangePercent) || other.avgChangePercent == avgChangePercent)&&(identical(other.bullishCount, bullishCount) || other.bullishCount == bullishCount)&&(identical(other.bearishCount, bearishCount) || other.bearishCount == bearishCount)&&(identical(other.relativeStrength, relativeStrength) || other.relativeStrength == relativeStrength)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank)&&const DeepCollectionEquality().equals(other.topBullish, _topBullish)&&const DeepCollectionEquality().equals(other.topBearish, _topBearish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,avgChangePercent,bullishCount,bearishCount,relativeStrength,rank,previousRank,const DeepCollectionEquality().hash(_topBullish),const DeepCollectionEquality().hash(_topBearish));
}

@override
String toString() {
    return 'SectorPerformance(name: $name, avgChangePercent: $avgChangePercent, bullishCount: $bullishCount, bearishCount: $bearishCount, relativeStrength: $relativeStrength, rank: $rank, previousRank: $previousRank, topBullish: $topBullish, topBearish: $topBearish)';
}


}

/// @nodoc
abstract mixin class _$SectorPerformanceCopyWith<$Res> implements $SectorPerformanceCopyWith<$Res> {
  factory _$SectorPerformanceCopyWith(_SectorPerformance value, $Res Function(_SectorPerformance) _then) = __$SectorPerformanceCopyWithImpl;
@override @useResult
$Res call({
 String name, double avgChangePercent, int bullishCount, int bearishCount, double relativeStrength, int rank, int previousRank, List<String> topBullish, List<String> topBearish
});




}
/// @nodoc
class __$SectorPerformanceCopyWithImpl<$Res>
    implements _$SectorPerformanceCopyWith<$Res> {
  __$SectorPerformanceCopyWithImpl(this._self, this._then);

  final _SectorPerformance _self;
  final $Res Function(_SectorPerformance) _then;

/// Create a copy of SectorPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? avgChangePercent = null,Object? bullishCount = null,Object? bearishCount = null,Object? relativeStrength = null,Object? rank = null,Object? previousRank = null,Object? topBullish = null,Object? topBearish = null,}) {
  return _then(_SectorPerformance(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avgChangePercent: null == avgChangePercent ? _self.avgChangePercent : avgChangePercent // ignore: cast_nullable_to_non_nullable
as double,bullishCount: null == bullishCount ? _self.bullishCount : bullishCount // ignore: cast_nullable_to_non_nullable
as int,bearishCount: null == bearishCount ? _self.bearishCount : bearishCount // ignore: cast_nullable_to_non_nullable
as int,relativeStrength: null == relativeStrength ? _self.relativeStrength : relativeStrength // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,topBullish: null == topBullish ? _self._topBullish : topBullish // ignore: cast_nullable_to_non_nullable
as List<String>,topBearish: null == topBearish ? _self._topBearish : topBearish // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
