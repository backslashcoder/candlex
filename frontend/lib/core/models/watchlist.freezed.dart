// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Watchlist {

 String get id; String get name; List<String> get symbols;
/// Create a copy of Watchlist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistCopyWith<Watchlist> get copyWith => _$WatchlistCopyWithImpl<Watchlist>(this as Watchlist, _$identity);

  /// Serializes this Watchlist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Watchlist;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Watchlist&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.symbols, _this.symbols));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Watchlist;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.symbols));
}

@override
String toString() {
  final _this = this as Watchlist;
  return 'Watchlist(id: ${_this.id}, name: ${_this.name}, symbols: ${_this.symbols})';
}


}

/// @nodoc
abstract mixin class $WatchlistCopyWith<$Res>  {
  factory $WatchlistCopyWith(Watchlist value, $Res Function(Watchlist) _then) = _$WatchlistCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> symbols
});




}
/// @nodoc
class _$WatchlistCopyWithImpl<$Res>
    implements $WatchlistCopyWith<$Res> {
  _$WatchlistCopyWithImpl(this._self, this._then);

  final Watchlist _self;
  final $Res Function(Watchlist) _then;

/// Create a copy of Watchlist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbols = null,}) {
  return _then(Watchlist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbols: null == symbols ? _self.symbols : symbols // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Watchlist].
extension WatchlistPatterns on Watchlist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Watchlist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Watchlist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Watchlist value)  $default,){
final _that = this;
switch (_that) {
case _Watchlist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Watchlist value)?  $default,){
final _that = this;
switch (_that) {
case _Watchlist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> symbols)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Watchlist() when $default != null:
return $default(_that.id,_that.name,_that.symbols);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> symbols)  $default,) {final _that = this;
switch (_that) {
case _Watchlist():
return $default(_that.id,_that.name,_that.symbols);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> symbols)?  $default,) {final _that = this;
switch (_that) {
case _Watchlist() when $default != null:
return $default(_that.id,_that.name,_that.symbols);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Watchlist implements Watchlist {
  const _Watchlist({required this.id, required this.name, required  List<String> symbols}): _symbols = symbols;
  factory _Watchlist.fromJson(Map<String, dynamic> json) => _$WatchlistFromJson(json);

@override final  String id;
@override final  String name;
 final  List<String> _symbols;
@override List<String> get symbols {
  if (_symbols is EqualUnmodifiableListView) return _symbols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symbols);
}


/// Create a copy of Watchlist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistCopyWith<_Watchlist> get copyWith => __$WatchlistCopyWithImpl<_Watchlist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Watchlist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.symbols, _symbols));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_symbols));
}

@override
String toString() {
    return 'Watchlist(id: $id, name: $name, symbols: $symbols)';
}


}

/// @nodoc
abstract mixin class _$WatchlistCopyWith<$Res> implements $WatchlistCopyWith<$Res> {
  factory _$WatchlistCopyWith(_Watchlist value, $Res Function(_Watchlist) _then) = __$WatchlistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> symbols
});




}
/// @nodoc
class __$WatchlistCopyWithImpl<$Res>
    implements _$WatchlistCopyWith<$Res> {
  __$WatchlistCopyWithImpl(this._self, this._then);

  final _Watchlist _self;
  final $Res Function(_Watchlist) _then;

/// Create a copy of Watchlist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbols = null,}) {
  return _then(_Watchlist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbols: null == symbols ? _self._symbols : symbols // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
