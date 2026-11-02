// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_signal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TradingSignal {

 String get id; String get symbol; String get sector; StrategyType get strategy; Direction get direction; Timeframe get timeframe; double get entryLow; double get entryHigh; double get stopLoss; double get target1; double get target2; SignalStatus get status; SignalConfidence get confidence; double get confidenceScore; DateTime get createdAt; String get reasoning; double get currentPrice;
/// Create a copy of TradingSignal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradingSignalCopyWith<TradingSignal> get copyWith => _$TradingSignalCopyWithImpl<TradingSignal>(this as TradingSignal, _$identity);

  /// Serializes this TradingSignal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TradingSignal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradingSignal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.sector, _this.sector) || other.sector == _this.sector)&&(identical(other.strategy, _this.strategy) || other.strategy == _this.strategy)&&(identical(other.direction, _this.direction) || other.direction == _this.direction)&&(identical(other.timeframe, _this.timeframe) || other.timeframe == _this.timeframe)&&(identical(other.entryLow, _this.entryLow) || other.entryLow == _this.entryLow)&&(identical(other.entryHigh, _this.entryHigh) || other.entryHigh == _this.entryHigh)&&(identical(other.stopLoss, _this.stopLoss) || other.stopLoss == _this.stopLoss)&&(identical(other.target1, _this.target1) || other.target1 == _this.target1)&&(identical(other.target2, _this.target2) || other.target2 == _this.target2)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.confidenceScore, _this.confidenceScore) || other.confidenceScore == _this.confidenceScore)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.reasoning, _this.reasoning) || other.reasoning == _this.reasoning)&&(identical(other.currentPrice, _this.currentPrice) || other.currentPrice == _this.currentPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TradingSignal;
  return Object.hash(runtimeType,_this.id,_this.symbol,_this.sector,_this.strategy,_this.direction,_this.timeframe,_this.entryLow,_this.entryHigh,_this.stopLoss,_this.target1,_this.target2,_this.status,_this.confidence,_this.confidenceScore,_this.createdAt,_this.reasoning,_this.currentPrice);
}

@override
String toString() {
  final _this = this as TradingSignal;
  return 'TradingSignal(id: ${_this.id}, symbol: ${_this.symbol}, sector: ${_this.sector}, strategy: ${_this.strategy}, direction: ${_this.direction}, timeframe: ${_this.timeframe}, entryLow: ${_this.entryLow}, entryHigh: ${_this.entryHigh}, stopLoss: ${_this.stopLoss}, target1: ${_this.target1}, target2: ${_this.target2}, status: ${_this.status}, confidence: ${_this.confidence}, confidenceScore: ${_this.confidenceScore}, createdAt: ${_this.createdAt}, reasoning: ${_this.reasoning}, currentPrice: ${_this.currentPrice})';
}


}

/// @nodoc
abstract mixin class $TradingSignalCopyWith<$Res>  {
  factory $TradingSignalCopyWith(TradingSignal value, $Res Function(TradingSignal) _then) = _$TradingSignalCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String sector, StrategyType strategy, Direction direction, Timeframe timeframe, double entryLow, double entryHigh, double stopLoss, double target1, double target2, SignalStatus status, SignalConfidence confidence, double confidenceScore, DateTime createdAt, String reasoning, double currentPrice
});




}
/// @nodoc
class _$TradingSignalCopyWithImpl<$Res>
    implements $TradingSignalCopyWith<$Res> {
  _$TradingSignalCopyWithImpl(this._self, this._then);

  final TradingSignal _self;
  final $Res Function(TradingSignal) _then;

/// Create a copy of TradingSignal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? sector = null,Object? strategy = null,Object? direction = null,Object? timeframe = null,Object? entryLow = null,Object? entryHigh = null,Object? stopLoss = null,Object? target1 = null,Object? target2 = null,Object? status = null,Object? confidence = null,Object? confidenceScore = null,Object? createdAt = null,Object? reasoning = null,Object? currentPrice = null,}) {
  return _then(TradingSignal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as StrategyType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,entryLow: null == entryLow ? _self.entryLow : entryLow // ignore: cast_nullable_to_non_nullable
as double,entryHigh: null == entryHigh ? _self.entryHigh : entryHigh // ignore: cast_nullable_to_non_nullable
as double,stopLoss: null == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double,target1: null == target1 ? _self.target1 : target1 // ignore: cast_nullable_to_non_nullable
as double,target2: null == target2 ? _self.target2 : target2 // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignalStatus,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as SignalConfidence,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TradingSignal].
extension TradingSignalPatterns on TradingSignal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TradingSignal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TradingSignal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TradingSignal value)  $default,){
final _that = this;
switch (_that) {
case _TradingSignal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TradingSignal value)?  $default,){
final _that = this;
switch (_that) {
case _TradingSignal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String sector,  StrategyType strategy,  Direction direction,  Timeframe timeframe,  double entryLow,  double entryHigh,  double stopLoss,  double target1,  double target2,  SignalStatus status,  SignalConfidence confidence,  double confidenceScore,  DateTime createdAt,  String reasoning,  double currentPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TradingSignal() when $default != null:
return $default(_that.id,_that.symbol,_that.sector,_that.strategy,_that.direction,_that.timeframe,_that.entryLow,_that.entryHigh,_that.stopLoss,_that.target1,_that.target2,_that.status,_that.confidence,_that.confidenceScore,_that.createdAt,_that.reasoning,_that.currentPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String sector,  StrategyType strategy,  Direction direction,  Timeframe timeframe,  double entryLow,  double entryHigh,  double stopLoss,  double target1,  double target2,  SignalStatus status,  SignalConfidence confidence,  double confidenceScore,  DateTime createdAt,  String reasoning,  double currentPrice)  $default,) {final _that = this;
switch (_that) {
case _TradingSignal():
return $default(_that.id,_that.symbol,_that.sector,_that.strategy,_that.direction,_that.timeframe,_that.entryLow,_that.entryHigh,_that.stopLoss,_that.target1,_that.target2,_that.status,_that.confidence,_that.confidenceScore,_that.createdAt,_that.reasoning,_that.currentPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String sector,  StrategyType strategy,  Direction direction,  Timeframe timeframe,  double entryLow,  double entryHigh,  double stopLoss,  double target1,  double target2,  SignalStatus status,  SignalConfidence confidence,  double confidenceScore,  DateTime createdAt,  String reasoning,  double currentPrice)?  $default,) {final _that = this;
switch (_that) {
case _TradingSignal() when $default != null:
return $default(_that.id,_that.symbol,_that.sector,_that.strategy,_that.direction,_that.timeframe,_that.entryLow,_that.entryHigh,_that.stopLoss,_that.target1,_that.target2,_that.status,_that.confidence,_that.confidenceScore,_that.createdAt,_that.reasoning,_that.currentPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TradingSignal extends TradingSignal {
  const _TradingSignal({required this.id, required this.symbol, required this.sector, required this.strategy, required this.direction, required this.timeframe, required this.entryLow, required this.entryHigh, required this.stopLoss, required this.target1, required this.target2, required this.status, required this.confidence, required this.confidenceScore, required this.createdAt, required this.reasoning, this.currentPrice = 0}): super._();
  factory _TradingSignal.fromJson(Map<String, dynamic> json) => _$TradingSignalFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String sector;
@override final  StrategyType strategy;
@override final  Direction direction;
@override final  Timeframe timeframe;
@override final  double entryLow;
@override final  double entryHigh;
@override final  double stopLoss;
@override final  double target1;
@override final  double target2;
@override final  SignalStatus status;
@override final  SignalConfidence confidence;
@override final  double confidenceScore;
@override final  DateTime createdAt;
@override final  String reasoning;
@override@JsonKey() final  double currentPrice;

/// Create a copy of TradingSignal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradingSignalCopyWith<_TradingSignal> get copyWith => __$TradingSignalCopyWithImpl<_TradingSignal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradingSignalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradingSignal&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.entryLow, entryLow) || other.entryLow == entryLow)&&(identical(other.entryHigh, entryHigh) || other.entryHigh == entryHigh)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.target1, target1) || other.target1 == target1)&&(identical(other.target2, target2) || other.target2 == target2)&&(identical(other.status, status) || other.status == status)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,symbol,sector,strategy,direction,timeframe,entryLow,entryHigh,stopLoss,target1,target2,status,confidence,confidenceScore,createdAt,reasoning,currentPrice);
}

@override
String toString() {
    return 'TradingSignal(id: $id, symbol: $symbol, sector: $sector, strategy: $strategy, direction: $direction, timeframe: $timeframe, entryLow: $entryLow, entryHigh: $entryHigh, stopLoss: $stopLoss, target1: $target1, target2: $target2, status: $status, confidence: $confidence, confidenceScore: $confidenceScore, createdAt: $createdAt, reasoning: $reasoning, currentPrice: $currentPrice)';
}


}

/// @nodoc
abstract mixin class _$TradingSignalCopyWith<$Res> implements $TradingSignalCopyWith<$Res> {
  factory _$TradingSignalCopyWith(_TradingSignal value, $Res Function(_TradingSignal) _then) = __$TradingSignalCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String sector, StrategyType strategy, Direction direction, Timeframe timeframe, double entryLow, double entryHigh, double stopLoss, double target1, double target2, SignalStatus status, SignalConfidence confidence, double confidenceScore, DateTime createdAt, String reasoning, double currentPrice
});




}
/// @nodoc
class __$TradingSignalCopyWithImpl<$Res>
    implements _$TradingSignalCopyWith<$Res> {
  __$TradingSignalCopyWithImpl(this._self, this._then);

  final _TradingSignal _self;
  final $Res Function(_TradingSignal) _then;

/// Create a copy of TradingSignal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? sector = null,Object? strategy = null,Object? direction = null,Object? timeframe = null,Object? entryLow = null,Object? entryHigh = null,Object? stopLoss = null,Object? target1 = null,Object? target2 = null,Object? status = null,Object? confidence = null,Object? confidenceScore = null,Object? createdAt = null,Object? reasoning = null,Object? currentPrice = null,}) {
  return _then(_TradingSignal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as StrategyType,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,entryLow: null == entryLow ? _self.entryLow : entryLow // ignore: cast_nullable_to_non_nullable
as double,entryHigh: null == entryHigh ? _self.entryHigh : entryHigh // ignore: cast_nullable_to_non_nullable
as double,stopLoss: null == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double,target1: null == target1 ? _self.target1 : target1 // ignore: cast_nullable_to_non_nullable
as double,target2: null == target2 ? _self.target2 : target2 // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignalStatus,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as SignalConfidence,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
