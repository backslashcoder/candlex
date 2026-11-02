// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketOverview {

 List<MarketIndex> get indices; MarketBreadth get breadth; Direction get sentiment; double get participation; String get leadingSector; String get weakestSector; MarketSession get session; DateTime get asOf;
/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketOverviewCopyWith<MarketOverview> get copyWith => _$MarketOverviewCopyWithImpl<MarketOverview>(this as MarketOverview, _$identity);

  /// Serializes this MarketOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketOverview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketOverview&&const DeepCollectionEquality().equals(other.indices, _this.indices)&&(identical(other.breadth, _this.breadth) || other.breadth == _this.breadth)&&(identical(other.sentiment, _this.sentiment) || other.sentiment == _this.sentiment)&&(identical(other.participation, _this.participation) || other.participation == _this.participation)&&(identical(other.leadingSector, _this.leadingSector) || other.leadingSector == _this.leadingSector)&&(identical(other.weakestSector, _this.weakestSector) || other.weakestSector == _this.weakestSector)&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.asOf, _this.asOf) || other.asOf == _this.asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketOverview;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.indices),_this.breadth,_this.sentiment,_this.participation,_this.leadingSector,_this.weakestSector,_this.session,_this.asOf);
}

@override
String toString() {
  final _this = this as MarketOverview;
  return 'MarketOverview(indices: ${_this.indices}, breadth: ${_this.breadth}, sentiment: ${_this.sentiment}, participation: ${_this.participation}, leadingSector: ${_this.leadingSector}, weakestSector: ${_this.weakestSector}, session: ${_this.session}, asOf: ${_this.asOf})';
}


}

/// @nodoc
abstract mixin class $MarketOverviewCopyWith<$Res>  {
  factory $MarketOverviewCopyWith(MarketOverview value, $Res Function(MarketOverview) _then) = _$MarketOverviewCopyWithImpl;
@useResult
$Res call({
 List<MarketIndex> indices, MarketBreadth breadth, Direction sentiment, double participation, String leadingSector, String weakestSector, MarketSession session, DateTime asOf
});


$MarketBreadthCopyWith<$Res> get breadth;

}
/// @nodoc
class _$MarketOverviewCopyWithImpl<$Res>
    implements $MarketOverviewCopyWith<$Res> {
  _$MarketOverviewCopyWithImpl(this._self, this._then);

  final MarketOverview _self;
  final $Res Function(MarketOverview) _then;

/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? indices = null,Object? breadth = null,Object? sentiment = null,Object? participation = null,Object? leadingSector = null,Object? weakestSector = null,Object? session = null,Object? asOf = null,}) {
  return _then(MarketOverview(
indices: null == indices ? _self.indices : indices // ignore: cast_nullable_to_non_nullable
as List<MarketIndex>,breadth: null == breadth ? _self.breadth : breadth // ignore: cast_nullable_to_non_nullable
as MarketBreadth,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as Direction,participation: null == participation ? _self.participation : participation // ignore: cast_nullable_to_non_nullable
as double,leadingSector: null == leadingSector ? _self.leadingSector : leadingSector // ignore: cast_nullable_to_non_nullable
as String,weakestSector: null == weakestSector ? _self.weakestSector : weakestSector // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as MarketSession,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketBreadthCopyWith<$Res> get breadth {
  
  return $MarketBreadthCopyWith<$Res>(_self.breadth, (value) {
    return _then(_self.copyWith(breadth: value));
  });
}
}


/// Adds pattern-matching-related methods to [MarketOverview].
extension MarketOverviewPatterns on MarketOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketOverview value)  $default,){
final _that = this;
switch (_that) {
case _MarketOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketOverview value)?  $default,){
final _that = this;
switch (_that) {
case _MarketOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MarketIndex> indices,  MarketBreadth breadth,  Direction sentiment,  double participation,  String leadingSector,  String weakestSector,  MarketSession session,  DateTime asOf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketOverview() when $default != null:
return $default(_that.indices,_that.breadth,_that.sentiment,_that.participation,_that.leadingSector,_that.weakestSector,_that.session,_that.asOf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MarketIndex> indices,  MarketBreadth breadth,  Direction sentiment,  double participation,  String leadingSector,  String weakestSector,  MarketSession session,  DateTime asOf)  $default,) {final _that = this;
switch (_that) {
case _MarketOverview():
return $default(_that.indices,_that.breadth,_that.sentiment,_that.participation,_that.leadingSector,_that.weakestSector,_that.session,_that.asOf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MarketIndex> indices,  MarketBreadth breadth,  Direction sentiment,  double participation,  String leadingSector,  String weakestSector,  MarketSession session,  DateTime asOf)?  $default,) {final _that = this;
switch (_that) {
case _MarketOverview() when $default != null:
return $default(_that.indices,_that.breadth,_that.sentiment,_that.participation,_that.leadingSector,_that.weakestSector,_that.session,_that.asOf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketOverview implements MarketOverview {
  const _MarketOverview({required  List<MarketIndex> indices, required this.breadth, required this.sentiment, required this.participation, required this.leadingSector, required this.weakestSector, required this.session, required this.asOf}): _indices = indices;
  factory _MarketOverview.fromJson(Map<String, dynamic> json) => _$MarketOverviewFromJson(json);

 final  List<MarketIndex> _indices;
@override List<MarketIndex> get indices {
  if (_indices is EqualUnmodifiableListView) return _indices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_indices);
}

@override final  MarketBreadth breadth;
@override final  Direction sentiment;
@override final  double participation;
@override final  String leadingSector;
@override final  String weakestSector;
@override final  MarketSession session;
@override final  DateTime asOf;

/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketOverviewCopyWith<_MarketOverview> get copyWith => __$MarketOverviewCopyWithImpl<_MarketOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketOverview&&const DeepCollectionEquality().equals(other.indices, _indices)&&(identical(other.breadth, breadth) || other.breadth == breadth)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment)&&(identical(other.participation, participation) || other.participation == participation)&&(identical(other.leadingSector, leadingSector) || other.leadingSector == leadingSector)&&(identical(other.weakestSector, weakestSector) || other.weakestSector == weakestSector)&&(identical(other.session, session) || other.session == session)&&(identical(other.asOf, asOf) || other.asOf == asOf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_indices),breadth,sentiment,participation,leadingSector,weakestSector,session,asOf);
}

@override
String toString() {
    return 'MarketOverview(indices: $indices, breadth: $breadth, sentiment: $sentiment, participation: $participation, leadingSector: $leadingSector, weakestSector: $weakestSector, session: $session, asOf: $asOf)';
}


}

/// @nodoc
abstract mixin class _$MarketOverviewCopyWith<$Res> implements $MarketOverviewCopyWith<$Res> {
  factory _$MarketOverviewCopyWith(_MarketOverview value, $Res Function(_MarketOverview) _then) = __$MarketOverviewCopyWithImpl;
@override @useResult
$Res call({
 List<MarketIndex> indices, MarketBreadth breadth, Direction sentiment, double participation, String leadingSector, String weakestSector, MarketSession session, DateTime asOf
});


@override $MarketBreadthCopyWith<$Res> get breadth;

}
/// @nodoc
class __$MarketOverviewCopyWithImpl<$Res>
    implements _$MarketOverviewCopyWith<$Res> {
  __$MarketOverviewCopyWithImpl(this._self, this._then);

  final _MarketOverview _self;
  final $Res Function(_MarketOverview) _then;

/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? indices = null,Object? breadth = null,Object? sentiment = null,Object? participation = null,Object? leadingSector = null,Object? weakestSector = null,Object? session = null,Object? asOf = null,}) {
  return _then(_MarketOverview(
indices: null == indices ? _self._indices : indices // ignore: cast_nullable_to_non_nullable
as List<MarketIndex>,breadth: null == breadth ? _self.breadth : breadth // ignore: cast_nullable_to_non_nullable
as MarketBreadth,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as Direction,participation: null == participation ? _self.participation : participation // ignore: cast_nullable_to_non_nullable
as double,leadingSector: null == leadingSector ? _self.leadingSector : leadingSector // ignore: cast_nullable_to_non_nullable
as String,weakestSector: null == weakestSector ? _self.weakestSector : weakestSector // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as MarketSession,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MarketOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketBreadthCopyWith<$Res> get breadth {
  
  return $MarketBreadthCopyWith<$Res>(_self.breadth, (value) {
    return _then(_self.copyWith(breadth: value));
  });
}
}

// dart format on
