import 'package:freezed_annotation/freezed_annotation.dart';

part 'candle.freezed.dart';
part 'candle.g.dart';

/// A single OHLCV bar plus the VWAP/EMA overlay values computed for it.
@freezed
abstract class Candle with _$Candle {
  const factory Candle({
    required DateTime time,
    required double open,
    required double high,
    required double low,
    required double close,
    required double volume,
    double? vwap,
    double? ema9,
    double? ema21,
  }) = _Candle;

  const Candle._();

  factory Candle.fromJson(Map<String, dynamic> json) => _$CandleFromJson(json);

  bool get isBullish => close >= open;
}
