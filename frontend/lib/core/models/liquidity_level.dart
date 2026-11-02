import 'package:freezed_annotation/freezed_annotation.dart';

part 'liquidity_level.freezed.dart';
part 'liquidity_level.g.dart';

/// A horizontal price level where resting liquidity is expected
/// (equal highs/lows, prior swing points, support/resistance).
@freezed
abstract class LiquidityLevel with _$LiquidityLevel {
  const factory LiquidityLevel({
    required double price,
    required String label,
    @Default(false) bool isResistance,
    @Default(false) bool isSwing,
  }) = _LiquidityLevel;

  factory LiquidityLevel.fromJson(Map<String, dynamic> json) =>
      _$LiquidityLevelFromJson(json);
}
