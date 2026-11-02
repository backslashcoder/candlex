// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technical_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TechnicalAnalysis {

 String get symbol; TrendDirection get trend; MomentumStatus get momentum; VwapPosition get vwapPosition; VolumeStatus get volume; OrderBlockStatus get orderBlockStatus; Direction get bias; String get marketStructure; String get liquidityContext; List<OrderBlock> get orderBlocks; List<LiquidityLevel> get liquidityLevels; List<double> get swingHighs; List<double> get swingLows;
/// Create a copy of TechnicalAnalysis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechnicalAnalysisCopyWith<TechnicalAnalysis> get copyWith => _$TechnicalAnalysisCopyWithImpl<TechnicalAnalysis>(this as TechnicalAnalysis, _$identity);

  /// Serializes this TechnicalAnalysis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TechnicalAnalysis;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechnicalAnalysis&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.trend, _this.trend) || other.trend == _this.trend)&&(identical(other.momentum, _this.momentum) || other.momentum == _this.momentum)&&(identical(other.vwapPosition, _this.vwapPosition) || other.vwapPosition == _this.vwapPosition)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.orderBlockStatus, _this.orderBlockStatus) || other.orderBlockStatus == _this.orderBlockStatus)&&(identical(other.bias, _this.bias) || other.bias == _this.bias)&&(identical(other.marketStructure, _this.marketStructure) || other.marketStructure == _this.marketStructure)&&(identical(other.liquidityContext, _this.liquidityContext) || other.liquidityContext == _this.liquidityContext)&&const DeepCollectionEquality().equals(other.orderBlocks, _this.orderBlocks)&&const DeepCollectionEquality().equals(other.liquidityLevels, _this.liquidityLevels)&&const DeepCollectionEquality().equals(other.swingHighs, _this.swingHighs)&&const DeepCollectionEquality().equals(other.swingLows, _this.swingLows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TechnicalAnalysis;
  return Object.hash(runtimeType,_this.symbol,_this.trend,_this.momentum,_this.vwapPosition,_this.volume,_this.orderBlockStatus,_this.bias,_this.marketStructure,_this.liquidityContext,const DeepCollectionEquality().hash(_this.orderBlocks),const DeepCollectionEquality().hash(_this.liquidityLevels),const DeepCollectionEquality().hash(_this.swingHighs),const DeepCollectionEquality().hash(_this.swingLows));
}

@override
String toString() {
  final _this = this as TechnicalAnalysis;
  return 'TechnicalAnalysis(symbol: ${_this.symbol}, trend: ${_this.trend}, momentum: ${_this.momentum}, vwapPosition: ${_this.vwapPosition}, volume: ${_this.volume}, orderBlockStatus: ${_this.orderBlockStatus}, bias: ${_this.bias}, marketStructure: ${_this.marketStructure}, liquidityContext: ${_this.liquidityContext}, orderBlocks: ${_this.orderBlocks}, liquidityLevels: ${_this.liquidityLevels}, swingHighs: ${_this.swingHighs}, swingLows: ${_this.swingLows})';
}


}

/// @nodoc
abstract mixin class $TechnicalAnalysisCopyWith<$Res>  {
  factory $TechnicalAnalysisCopyWith(TechnicalAnalysis value, $Res Function(TechnicalAnalysis) _then) = _$TechnicalAnalysisCopyWithImpl;
@useResult
$Res call({
 String symbol, TrendDirection trend, MomentumStatus momentum, VwapPosition vwapPosition, VolumeStatus volume, OrderBlockStatus orderBlockStatus, Direction bias, String marketStructure, String liquidityContext, List<OrderBlock> orderBlocks, List<LiquidityLevel> liquidityLevels, List<double> swingHighs, List<double> swingLows
});




}
/// @nodoc
class _$TechnicalAnalysisCopyWithImpl<$Res>
    implements $TechnicalAnalysisCopyWith<$Res> {
  _$TechnicalAnalysisCopyWithImpl(this._self, this._then);

  final TechnicalAnalysis _self;
  final $Res Function(TechnicalAnalysis) _then;

/// Create a copy of TechnicalAnalysis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? trend = null,Object? momentum = null,Object? vwapPosition = null,Object? volume = null,Object? orderBlockStatus = null,Object? bias = null,Object? marketStructure = null,Object? liquidityContext = null,Object? orderBlocks = null,Object? liquidityLevels = null,Object? swingHighs = null,Object? swingLows = null,}) {
  return _then(TechnicalAnalysis(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,trend: null == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as TrendDirection,momentum: null == momentum ? _self.momentum : momentum // ignore: cast_nullable_to_non_nullable
as MomentumStatus,vwapPosition: null == vwapPosition ? _self.vwapPosition : vwapPosition // ignore: cast_nullable_to_non_nullable
as VwapPosition,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as VolumeStatus,orderBlockStatus: null == orderBlockStatus ? _self.orderBlockStatus : orderBlockStatus // ignore: cast_nullable_to_non_nullable
as OrderBlockStatus,bias: null == bias ? _self.bias : bias // ignore: cast_nullable_to_non_nullable
as Direction,marketStructure: null == marketStructure ? _self.marketStructure : marketStructure // ignore: cast_nullable_to_non_nullable
as String,liquidityContext: null == liquidityContext ? _self.liquidityContext : liquidityContext // ignore: cast_nullable_to_non_nullable
as String,orderBlocks: null == orderBlocks ? _self.orderBlocks : orderBlocks // ignore: cast_nullable_to_non_nullable
as List<OrderBlock>,liquidityLevels: null == liquidityLevels ? _self.liquidityLevels : liquidityLevels // ignore: cast_nullable_to_non_nullable
as List<LiquidityLevel>,swingHighs: null == swingHighs ? _self.swingHighs : swingHighs // ignore: cast_nullable_to_non_nullable
as List<double>,swingLows: null == swingLows ? _self.swingLows : swingLows // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [TechnicalAnalysis].
extension TechnicalAnalysisPatterns on TechnicalAnalysis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TechnicalAnalysis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TechnicalAnalysis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TechnicalAnalysis value)  $default,){
final _that = this;
switch (_that) {
case _TechnicalAnalysis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TechnicalAnalysis value)?  $default,){
final _that = this;
switch (_that) {
case _TechnicalAnalysis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  TrendDirection trend,  MomentumStatus momentum,  VwapPosition vwapPosition,  VolumeStatus volume,  OrderBlockStatus orderBlockStatus,  Direction bias,  String marketStructure,  String liquidityContext,  List<OrderBlock> orderBlocks,  List<LiquidityLevel> liquidityLevels,  List<double> swingHighs,  List<double> swingLows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TechnicalAnalysis() when $default != null:
return $default(_that.symbol,_that.trend,_that.momentum,_that.vwapPosition,_that.volume,_that.orderBlockStatus,_that.bias,_that.marketStructure,_that.liquidityContext,_that.orderBlocks,_that.liquidityLevels,_that.swingHighs,_that.swingLows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  TrendDirection trend,  MomentumStatus momentum,  VwapPosition vwapPosition,  VolumeStatus volume,  OrderBlockStatus orderBlockStatus,  Direction bias,  String marketStructure,  String liquidityContext,  List<OrderBlock> orderBlocks,  List<LiquidityLevel> liquidityLevels,  List<double> swingHighs,  List<double> swingLows)  $default,) {final _that = this;
switch (_that) {
case _TechnicalAnalysis():
return $default(_that.symbol,_that.trend,_that.momentum,_that.vwapPosition,_that.volume,_that.orderBlockStatus,_that.bias,_that.marketStructure,_that.liquidityContext,_that.orderBlocks,_that.liquidityLevels,_that.swingHighs,_that.swingLows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  TrendDirection trend,  MomentumStatus momentum,  VwapPosition vwapPosition,  VolumeStatus volume,  OrderBlockStatus orderBlockStatus,  Direction bias,  String marketStructure,  String liquidityContext,  List<OrderBlock> orderBlocks,  List<LiquidityLevel> liquidityLevels,  List<double> swingHighs,  List<double> swingLows)?  $default,) {final _that = this;
switch (_that) {
case _TechnicalAnalysis() when $default != null:
return $default(_that.symbol,_that.trend,_that.momentum,_that.vwapPosition,_that.volume,_that.orderBlockStatus,_that.bias,_that.marketStructure,_that.liquidityContext,_that.orderBlocks,_that.liquidityLevels,_that.swingHighs,_that.swingLows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TechnicalAnalysis implements TechnicalAnalysis {
  const _TechnicalAnalysis({required this.symbol, required this.trend, required this.momentum, required this.vwapPosition, required this.volume, required this.orderBlockStatus, required this.bias, required this.marketStructure, required this.liquidityContext, required  List<OrderBlock> orderBlocks, required  List<LiquidityLevel> liquidityLevels,  List<double> swingHighs = const <double>[],  List<double> swingLows = const <double>[]}): _orderBlocks = orderBlocks,_liquidityLevels = liquidityLevels,_swingHighs = swingHighs,_swingLows = swingLows;
  factory _TechnicalAnalysis.fromJson(Map<String, dynamic> json) => _$TechnicalAnalysisFromJson(json);

@override final  String symbol;
@override final  TrendDirection trend;
@override final  MomentumStatus momentum;
@override final  VwapPosition vwapPosition;
@override final  VolumeStatus volume;
@override final  OrderBlockStatus orderBlockStatus;
@override final  Direction bias;
@override final  String marketStructure;
@override final  String liquidityContext;
 final  List<OrderBlock> _orderBlocks;
@override List<OrderBlock> get orderBlocks {
  if (_orderBlocks is EqualUnmodifiableListView) return _orderBlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderBlocks);
}

 final  List<LiquidityLevel> _liquidityLevels;
@override List<LiquidityLevel> get liquidityLevels {
  if (_liquidityLevels is EqualUnmodifiableListView) return _liquidityLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liquidityLevels);
}

 final  List<double> _swingHighs;
@override@JsonKey() List<double> get swingHighs {
  if (_swingHighs is EqualUnmodifiableListView) return _swingHighs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_swingHighs);
}

 final  List<double> _swingLows;
@override@JsonKey() List<double> get swingLows {
  if (_swingLows is EqualUnmodifiableListView) return _swingLows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_swingLows);
}


/// Create a copy of TechnicalAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TechnicalAnalysisCopyWith<_TechnicalAnalysis> get copyWith => __$TechnicalAnalysisCopyWithImpl<_TechnicalAnalysis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TechnicalAnalysisToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TechnicalAnalysis&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.trend, trend) || other.trend == trend)&&(identical(other.momentum, momentum) || other.momentum == momentum)&&(identical(other.vwapPosition, vwapPosition) || other.vwapPosition == vwapPosition)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.orderBlockStatus, orderBlockStatus) || other.orderBlockStatus == orderBlockStatus)&&(identical(other.bias, bias) || other.bias == bias)&&(identical(other.marketStructure, marketStructure) || other.marketStructure == marketStructure)&&(identical(other.liquidityContext, liquidityContext) || other.liquidityContext == liquidityContext)&&const DeepCollectionEquality().equals(other.orderBlocks, _orderBlocks)&&const DeepCollectionEquality().equals(other.liquidityLevels, _liquidityLevels)&&const DeepCollectionEquality().equals(other.swingHighs, _swingHighs)&&const DeepCollectionEquality().equals(other.swingLows, _swingLows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,symbol,trend,momentum,vwapPosition,volume,orderBlockStatus,bias,marketStructure,liquidityContext,const DeepCollectionEquality().hash(_orderBlocks),const DeepCollectionEquality().hash(_liquidityLevels),const DeepCollectionEquality().hash(_swingHighs),const DeepCollectionEquality().hash(_swingLows));
}

@override
String toString() {
    return 'TechnicalAnalysis(symbol: $symbol, trend: $trend, momentum: $momentum, vwapPosition: $vwapPosition, volume: $volume, orderBlockStatus: $orderBlockStatus, bias: $bias, marketStructure: $marketStructure, liquidityContext: $liquidityContext, orderBlocks: $orderBlocks, liquidityLevels: $liquidityLevels, swingHighs: $swingHighs, swingLows: $swingLows)';
}


}

/// @nodoc
abstract mixin class _$TechnicalAnalysisCopyWith<$Res> implements $TechnicalAnalysisCopyWith<$Res> {
  factory _$TechnicalAnalysisCopyWith(_TechnicalAnalysis value, $Res Function(_TechnicalAnalysis) _then) = __$TechnicalAnalysisCopyWithImpl;
@override @useResult
$Res call({
 String symbol, TrendDirection trend, MomentumStatus momentum, VwapPosition vwapPosition, VolumeStatus volume, OrderBlockStatus orderBlockStatus, Direction bias, String marketStructure, String liquidityContext, List<OrderBlock> orderBlocks, List<LiquidityLevel> liquidityLevels, List<double> swingHighs, List<double> swingLows
});




}
/// @nodoc
class __$TechnicalAnalysisCopyWithImpl<$Res>
    implements _$TechnicalAnalysisCopyWith<$Res> {
  __$TechnicalAnalysisCopyWithImpl(this._self, this._then);

  final _TechnicalAnalysis _self;
  final $Res Function(_TechnicalAnalysis) _then;

/// Create a copy of TechnicalAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? trend = null,Object? momentum = null,Object? vwapPosition = null,Object? volume = null,Object? orderBlockStatus = null,Object? bias = null,Object? marketStructure = null,Object? liquidityContext = null,Object? orderBlocks = null,Object? liquidityLevels = null,Object? swingHighs = null,Object? swingLows = null,}) {
  return _then(_TechnicalAnalysis(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,trend: null == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as TrendDirection,momentum: null == momentum ? _self.momentum : momentum // ignore: cast_nullable_to_non_nullable
as MomentumStatus,vwapPosition: null == vwapPosition ? _self.vwapPosition : vwapPosition // ignore: cast_nullable_to_non_nullable
as VwapPosition,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as VolumeStatus,orderBlockStatus: null == orderBlockStatus ? _self.orderBlockStatus : orderBlockStatus // ignore: cast_nullable_to_non_nullable
as OrderBlockStatus,bias: null == bias ? _self.bias : bias // ignore: cast_nullable_to_non_nullable
as Direction,marketStructure: null == marketStructure ? _self.marketStructure : marketStructure // ignore: cast_nullable_to_non_nullable
as String,liquidityContext: null == liquidityContext ? _self.liquidityContext : liquidityContext // ignore: cast_nullable_to_non_nullable
as String,orderBlocks: null == orderBlocks ? _self._orderBlocks : orderBlocks // ignore: cast_nullable_to_non_nullable
as List<OrderBlock>,liquidityLevels: null == liquidityLevels ? _self._liquidityLevels : liquidityLevels // ignore: cast_nullable_to_non_nullable
as List<LiquidityLevel>,swingHighs: null == swingHighs ? _self._swingHighs : swingHighs // ignore: cast_nullable_to_non_nullable
as List<double>,swingLows: null == swingLows ? _self._swingLows : swingLows // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
