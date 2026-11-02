import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'trading_signal.freezed.dart';
part 'trading_signal.g.dart';

/// A simulated trading setup produced by the mock strategy engine.
///
/// NOTE: confidence is a simulated heuristic, NOT a calibrated probability.
@freezed
abstract class TradingSignal with _$TradingSignal {
  const factory TradingSignal({
    required String id,
    required String symbol,
    required String sector,
    required StrategyType strategy,
    required Direction direction,
    required Timeframe timeframe,
    required double entryLow,
    required double entryHigh,
    required double stopLoss,
    required double target1,
    required double target2,
    required SignalStatus status,
    required SignalConfidence confidence,
    required double confidenceScore,
    required DateTime createdAt,
    required String reasoning,
    @Default(0) double currentPrice,
  }) = _TradingSignal;

  const TradingSignal._();

  factory TradingSignal.fromJson(Map<String, dynamic> json) =>
      _$TradingSignalFromJson(json);

  double get entryMid => (entryLow + entryHigh) / 2;

  /// Reward-to-risk to target 1.
  double get riskReward {
    final risk = (entryMid - stopLoss).abs();
    final reward = (target1 - entryMid).abs();
    return risk == 0 ? 0 : reward / risk;
  }

  bool get isActive =>
      status == SignalStatus.active || status == SignalStatus.triggered;
}
