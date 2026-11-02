import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'strategy.freezed.dart';
part 'strategy.g.dart';

/// Metadata describing a mock strategy category.
@freezed
abstract class Strategy with _$Strategy {
  const factory Strategy({
    required StrategyType type,
    required String description,
    required int activeCount,
    required double winRateHeuristic,
  }) = _Strategy;

  factory Strategy.fromJson(Map<String, dynamic> json) =>
      _$StrategyFromJson(json);
}
