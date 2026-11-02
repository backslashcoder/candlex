// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stock {

 String get symbol; String get name; String get sector; Exchange get exchange; double get ltp; double get previousClose; double get dayHigh; double get dayLow; double get open; double get volume; double get avgVolume; double get marketCap; double get strengthScore; double get liquidityScore; double get vwap; int get rank; int get previousRank; OrderBlockStatus get orderBlockStatus; bool get isFno;
/// Create a copy of Stock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockCopyWith<Stock> get copyWith => _$StockCopyWithImpl<Stock>(this as Stock, _$identity);

  /// Serializes this Stock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Stock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stock&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sector, _this.sector) || other.sector == _this.sector)&&(identical(other.exchange, _this.exchange) || other.exchange == _this.exchange)&&(identical(other.ltp, _this.ltp) || other.ltp == _this.ltp)&&(identical(other.previousClose, _this.previousClose) || other.previousClose == _this.previousClose)&&(identical(other.dayHigh, _this.dayHigh) || other.dayHigh == _this.dayHigh)&&(identical(other.dayLow, _this.dayLow) || other.dayLow == _this.dayLow)&&(identical(other.open, _this.open) || other.open == _this.open)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.avgVolume, _this.avgVolume) || other.avgVolume == _this.avgVolume)&&(identical(other.marketCap, _this.marketCap) || other.marketCap == _this.marketCap)&&(identical(other.strengthScore, _this.strengthScore) || other.strengthScore == _this.strengthScore)&&(identical(other.liquidityScore, _this.liquidityScore) || other.liquidityScore == _this.liquidityScore)&&(identical(other.vwap, _this.vwap) || other.vwap == _this.vwap)&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&(identical(other.previousRank, _this.previousRank) || other.previousRank == _this.previousRank)&&(identical(other.orderBlockStatus, _this.orderBlockStatus) || other.orderBlockStatus == _this.orderBlockStatus)&&(identical(other.isFno, _this.isFno) || other.isFno == _this.isFno));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Stock;
  return Object.hashAll([runtimeType,_this.symbol,_this.name,_this.sector,_this.exchange,_this.ltp,_this.previousClose,_this.dayHigh,_this.dayLow,_this.open,_this.volume,_this.avgVolume,_this.marketCap,_this.strengthScore,_this.liquidityScore,_this.vwap,_this.rank,_this.previousRank,_this.orderBlockStatus,_this.isFno]);
}

@override
String toString() {
  final _this = this as Stock;
  return 'Stock(symbol: ${_this.symbol}, name: ${_this.name}, sector: ${_this.sector}, exchange: ${_this.exchange}, ltp: ${_this.ltp}, previousClose: ${_this.previousClose}, dayHigh: ${_this.dayHigh}, dayLow: ${_this.dayLow}, open: ${_this.open}, volume: ${_this.volume}, avgVolume: ${_this.avgVolume}, marketCap: ${_this.marketCap}, strengthScore: ${_this.strengthScore}, liquidityScore: ${_this.liquidityScore}, vwap: ${_this.vwap}, rank: ${_this.rank}, previousRank: ${_this.previousRank}, orderBlockStatus: ${_this.orderBlockStatus}, isFno: ${_this.isFno})';
}


}

/// @nodoc
abstract mixin class $StockCopyWith<$Res>  {
  factory $StockCopyWith(Stock value, $Res Function(Stock) _then) = _$StockCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, String sector, Exchange exchange, double ltp, double previousClose, double dayHigh, double dayLow, double open, double volume, double avgVolume, double marketCap, double strengthScore, double liquidityScore, double vwap, int rank, int previousRank, OrderBlockStatus orderBlockStatus, bool isFno
});




}
/// @nodoc
class _$StockCopyWithImpl<$Res>
    implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._self, this._then);

  final Stock _self;
  final $Res Function(Stock) _then;

/// Create a copy of Stock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? sector = null,Object? exchange = null,Object? ltp = null,Object? previousClose = null,Object? dayHigh = null,Object? dayLow = null,Object? open = null,Object? volume = null,Object? avgVolume = null,Object? marketCap = null,Object? strengthScore = null,Object? liquidityScore = null,Object? vwap = null,Object? rank = null,Object? previousRank = null,Object? orderBlockStatus = null,Object? isFno = null,}) {
  return _then(Stock(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,exchange: null == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as Exchange,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,dayHigh: null == dayHigh ? _self.dayHigh : dayHigh // ignore: cast_nullable_to_non_nullable
as double,dayLow: null == dayLow ? _self.dayLow : dayLow // ignore: cast_nullable_to_non_nullable
as double,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,avgVolume: null == avgVolume ? _self.avgVolume : avgVolume // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,strengthScore: null == strengthScore ? _self.strengthScore : strengthScore // ignore: cast_nullable_to_non_nullable
as double,liquidityScore: null == liquidityScore ? _self.liquidityScore : liquidityScore // ignore: cast_nullable_to_non_nullable
as double,vwap: null == vwap ? _self.vwap : vwap // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,orderBlockStatus: null == orderBlockStatus ? _self.orderBlockStatus : orderBlockStatus // ignore: cast_nullable_to_non_nullable
as OrderBlockStatus,isFno: null == isFno ? _self.isFno : isFno // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Stock].
extension StockPatterns on Stock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stock value)  $default,){
final _that = this;
switch (_that) {
case _Stock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stock value)?  $default,){
final _that = this;
switch (_that) {
case _Stock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  String sector,  Exchange exchange,  double ltp,  double previousClose,  double dayHigh,  double dayLow,  double open,  double volume,  double avgVolume,  double marketCap,  double strengthScore,  double liquidityScore,  double vwap,  int rank,  int previousRank,  OrderBlockStatus orderBlockStatus,  bool isFno)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stock() when $default != null:
return $default(_that.symbol,_that.name,_that.sector,_that.exchange,_that.ltp,_that.previousClose,_that.dayHigh,_that.dayLow,_that.open,_that.volume,_that.avgVolume,_that.marketCap,_that.strengthScore,_that.liquidityScore,_that.vwap,_that.rank,_that.previousRank,_that.orderBlockStatus,_that.isFno);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  String sector,  Exchange exchange,  double ltp,  double previousClose,  double dayHigh,  double dayLow,  double open,  double volume,  double avgVolume,  double marketCap,  double strengthScore,  double liquidityScore,  double vwap,  int rank,  int previousRank,  OrderBlockStatus orderBlockStatus,  bool isFno)  $default,) {final _that = this;
switch (_that) {
case _Stock():
return $default(_that.symbol,_that.name,_that.sector,_that.exchange,_that.ltp,_that.previousClose,_that.dayHigh,_that.dayLow,_that.open,_that.volume,_that.avgVolume,_that.marketCap,_that.strengthScore,_that.liquidityScore,_that.vwap,_that.rank,_that.previousRank,_that.orderBlockStatus,_that.isFno);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  String sector,  Exchange exchange,  double ltp,  double previousClose,  double dayHigh,  double dayLow,  double open,  double volume,  double avgVolume,  double marketCap,  double strengthScore,  double liquidityScore,  double vwap,  int rank,  int previousRank,  OrderBlockStatus orderBlockStatus,  bool isFno)?  $default,) {final _that = this;
switch (_that) {
case _Stock() when $default != null:
return $default(_that.symbol,_that.name,_that.sector,_that.exchange,_that.ltp,_that.previousClose,_that.dayHigh,_that.dayLow,_that.open,_that.volume,_that.avgVolume,_that.marketCap,_that.strengthScore,_that.liquidityScore,_that.vwap,_that.rank,_that.previousRank,_that.orderBlockStatus,_that.isFno);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stock extends Stock {
  const _Stock({required this.symbol, required this.name, required this.sector, required this.exchange, required this.ltp, required this.previousClose, required this.dayHigh, required this.dayLow, required this.open, required this.volume, required this.avgVolume, required this.marketCap, required this.strengthScore, required this.liquidityScore, required this.vwap, this.rank = 0, this.previousRank = 0, this.orderBlockStatus = OrderBlockStatus.none, this.isFno = true}): super._();
  factory _Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  String sector;
@override final  Exchange exchange;
@override final  double ltp;
@override final  double previousClose;
@override final  double dayHigh;
@override final  double dayLow;
@override final  double open;
@override final  double volume;
@override final  double avgVolume;
@override final  double marketCap;
@override final  double strengthScore;
@override final  double liquidityScore;
@override final  double vwap;
@override@JsonKey() final  int rank;
@override@JsonKey() final  int previousRank;
@override@JsonKey() final  OrderBlockStatus orderBlockStatus;
@override@JsonKey() final  bool isFno;

/// Create a copy of Stock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockCopyWith<_Stock> get copyWith => __$StockCopyWithImpl<_Stock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stock&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.exchange, exchange) || other.exchange == exchange)&&(identical(other.ltp, ltp) || other.ltp == ltp)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.dayHigh, dayHigh) || other.dayHigh == dayHigh)&&(identical(other.dayLow, dayLow) || other.dayLow == dayLow)&&(identical(other.open, open) || other.open == open)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.avgVolume, avgVolume) || other.avgVolume == avgVolume)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.strengthScore, strengthScore) || other.strengthScore == strengthScore)&&(identical(other.liquidityScore, liquidityScore) || other.liquidityScore == liquidityScore)&&(identical(other.vwap, vwap) || other.vwap == vwap)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.previousRank, previousRank) || other.previousRank == previousRank)&&(identical(other.orderBlockStatus, orderBlockStatus) || other.orderBlockStatus == orderBlockStatus)&&(identical(other.isFno, isFno) || other.isFno == isFno));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,symbol,name,sector,exchange,ltp,previousClose,dayHigh,dayLow,open,volume,avgVolume,marketCap,strengthScore,liquidityScore,vwap,rank,previousRank,orderBlockStatus,isFno]);
}

@override
String toString() {
    return 'Stock(symbol: $symbol, name: $name, sector: $sector, exchange: $exchange, ltp: $ltp, previousClose: $previousClose, dayHigh: $dayHigh, dayLow: $dayLow, open: $open, volume: $volume, avgVolume: $avgVolume, marketCap: $marketCap, strengthScore: $strengthScore, liquidityScore: $liquidityScore, vwap: $vwap, rank: $rank, previousRank: $previousRank, orderBlockStatus: $orderBlockStatus, isFno: $isFno)';
}


}

/// @nodoc
abstract mixin class _$StockCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$StockCopyWith(_Stock value, $Res Function(_Stock) _then) = __$StockCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, String sector, Exchange exchange, double ltp, double previousClose, double dayHigh, double dayLow, double open, double volume, double avgVolume, double marketCap, double strengthScore, double liquidityScore, double vwap, int rank, int previousRank, OrderBlockStatus orderBlockStatus, bool isFno
});




}
/// @nodoc
class __$StockCopyWithImpl<$Res>
    implements _$StockCopyWith<$Res> {
  __$StockCopyWithImpl(this._self, this._then);

  final _Stock _self;
  final $Res Function(_Stock) _then;

/// Create a copy of Stock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? sector = null,Object? exchange = null,Object? ltp = null,Object? previousClose = null,Object? dayHigh = null,Object? dayLow = null,Object? open = null,Object? volume = null,Object? avgVolume = null,Object? marketCap = null,Object? strengthScore = null,Object? liquidityScore = null,Object? vwap = null,Object? rank = null,Object? previousRank = null,Object? orderBlockStatus = null,Object? isFno = null,}) {
  return _then(_Stock(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,exchange: null == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as Exchange,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,dayHigh: null == dayHigh ? _self.dayHigh : dayHigh // ignore: cast_nullable_to_non_nullable
as double,dayLow: null == dayLow ? _self.dayLow : dayLow // ignore: cast_nullable_to_non_nullable
as double,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,avgVolume: null == avgVolume ? _self.avgVolume : avgVolume // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,strengthScore: null == strengthScore ? _self.strengthScore : strengthScore // ignore: cast_nullable_to_non_nullable
as double,liquidityScore: null == liquidityScore ? _self.liquidityScore : liquidityScore // ignore: cast_nullable_to_non_nullable
as double,vwap: null == vwap ? _self.vwap : vwap // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,previousRank: null == previousRank ? _self.previousRank : previousRank // ignore: cast_nullable_to_non_nullable
as int,orderBlockStatus: null == orderBlockStatus ? _self.orderBlockStatus : orderBlockStatus // ignore: cast_nullable_to_non_nullable
as OrderBlockStatus,isFno: null == isFno ? _self.isFno : isFno // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
