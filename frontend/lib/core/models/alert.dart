import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

enum AlertKind {
  bullishSignal,
  bearishSignal,
  entryTrigger,
  targetUpdate,
  invalidation,
  dailySummary,
}

/// A simulated Telegram alert entry in the alert history.
@freezed
abstract class Alert with _$Alert {
  const factory Alert({
    required String id,
    required AlertKind kind,
    required String symbol,
    required String message,
    required DateTime time,
    required Direction direction,
    @Default(false) bool delivered,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}

extension AlertKindX on AlertKind {
  String get label => switch (this) {
        AlertKind.bullishSignal => 'Bullish Signal',
        AlertKind.bearishSignal => 'Bearish Signal',
        AlertKind.entryTrigger => 'Entry Trigger',
        AlertKind.targetUpdate => 'Target Update',
        AlertKind.invalidation => 'Invalidation',
        AlertKind.dailySummary => 'Daily Summary',
      };
}
