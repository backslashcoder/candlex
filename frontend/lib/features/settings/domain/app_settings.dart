import '../../../core/enums.dart';

enum NumberFormatStyle { indian, international }

/// User-configurable application settings. Plain immutable value object with
/// JSON (de)serialization for local persistence.
class AppSettings {
  const AppSettings({
    this.themeDark = true,
    this.numberFormat = NumberFormatStyle.indian,
    this.defaultTimeframe = Timeframe.m15,
    this.defaultWatchlistId = 'default',
    this.minStrengthDefault = 0,
    this.minVolumeRatioDefault = 0,
    this.compactTables = true,
    // Telegram / notification preferences.
    this.telegramConnected = false,
    this.alertBullish = true,
    this.alertBearish = true,
    this.alertEntryTriggers = true,
    this.alertTargetUpdates = true,
    this.alertInvalidations = true,
    this.alertDailySummary = true,
    this.alertSelectedStocksOnly = false,
    this.alertSelectedStrategiesOnly = false,
  });

  final bool themeDark;
  final NumberFormatStyle numberFormat;
  final Timeframe defaultTimeframe;
  final String defaultWatchlistId;
  final double minStrengthDefault;
  final double minVolumeRatioDefault;
  final bool compactTables;
  final bool telegramConnected;
  final bool alertBullish;
  final bool alertBearish;
  final bool alertEntryTriggers;
  final bool alertTargetUpdates;
  final bool alertInvalidations;
  final bool alertDailySummary;
  final bool alertSelectedStocksOnly;
  final bool alertSelectedStrategiesOnly;

  AppSettings copyWith({
    bool? themeDark,
    NumberFormatStyle? numberFormat,
    Timeframe? defaultTimeframe,
    String? defaultWatchlistId,
    double? minStrengthDefault,
    double? minVolumeRatioDefault,
    bool? compactTables,
    bool? telegramConnected,
    bool? alertBullish,
    bool? alertBearish,
    bool? alertEntryTriggers,
    bool? alertTargetUpdates,
    bool? alertInvalidations,
    bool? alertDailySummary,
    bool? alertSelectedStocksOnly,
    bool? alertSelectedStrategiesOnly,
  }) {
    return AppSettings(
      themeDark: themeDark ?? this.themeDark,
      numberFormat: numberFormat ?? this.numberFormat,
      defaultTimeframe: defaultTimeframe ?? this.defaultTimeframe,
      defaultWatchlistId: defaultWatchlistId ?? this.defaultWatchlistId,
      minStrengthDefault: minStrengthDefault ?? this.minStrengthDefault,
      minVolumeRatioDefault: minVolumeRatioDefault ?? this.minVolumeRatioDefault,
      compactTables: compactTables ?? this.compactTables,
      telegramConnected: telegramConnected ?? this.telegramConnected,
      alertBullish: alertBullish ?? this.alertBullish,
      alertBearish: alertBearish ?? this.alertBearish,
      alertEntryTriggers: alertEntryTriggers ?? this.alertEntryTriggers,
      alertTargetUpdates: alertTargetUpdates ?? this.alertTargetUpdates,
      alertInvalidations: alertInvalidations ?? this.alertInvalidations,
      alertDailySummary: alertDailySummary ?? this.alertDailySummary,
      alertSelectedStocksOnly:
          alertSelectedStocksOnly ?? this.alertSelectedStocksOnly,
      alertSelectedStrategiesOnly:
          alertSelectedStrategiesOnly ?? this.alertSelectedStrategiesOnly,
    );
  }

  Map<String, dynamic> toJson() => {
        'themeDark': themeDark,
        'numberFormat': numberFormat.name,
        'defaultTimeframe': defaultTimeframe.name,
        'defaultWatchlistId': defaultWatchlistId,
        'minStrengthDefault': minStrengthDefault,
        'minVolumeRatioDefault': minVolumeRatioDefault,
        'compactTables': compactTables,
        'telegramConnected': telegramConnected,
        'alertBullish': alertBullish,
        'alertBearish': alertBearish,
        'alertEntryTriggers': alertEntryTriggers,
        'alertTargetUpdates': alertTargetUpdates,
        'alertInvalidations': alertInvalidations,
        'alertDailySummary': alertDailySummary,
        'alertSelectedStocksOnly': alertSelectedStocksOnly,
        'alertSelectedStrategiesOnly': alertSelectedStrategiesOnly,
      };

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    T parseEnum<T>(List<T> values, String? name, T fallback) {
      for (final v in values) {
        if ((v as Enum).name == name) return v;
      }
      return fallback;
    }

    return AppSettings(
      themeDark: json['themeDark'] as bool? ?? true,
      numberFormat: parseEnum(NumberFormatStyle.values,
          json['numberFormat'] as String?, NumberFormatStyle.indian),
      defaultTimeframe: parseEnum(
          Timeframe.values, json['defaultTimeframe'] as String?, Timeframe.m15),
      defaultWatchlistId: json['defaultWatchlistId'] as String? ?? 'default',
      minStrengthDefault:
          (json['minStrengthDefault'] as num?)?.toDouble() ?? 0,
      minVolumeRatioDefault:
          (json['minVolumeRatioDefault'] as num?)?.toDouble() ?? 0,
      compactTables: json['compactTables'] as bool? ?? true,
      telegramConnected: json['telegramConnected'] as bool? ?? false,
      alertBullish: json['alertBullish'] as bool? ?? true,
      alertBearish: json['alertBearish'] as bool? ?? true,
      alertEntryTriggers: json['alertEntryTriggers'] as bool? ?? true,
      alertTargetUpdates: json['alertTargetUpdates'] as bool? ?? true,
      alertInvalidations: json['alertInvalidations'] as bool? ?? true,
      alertDailySummary: json['alertDailySummary'] as bool? ?? true,
      alertSelectedStocksOnly: json['alertSelectedStocksOnly'] as bool? ?? false,
      alertSelectedStrategiesOnly:
          json['alertSelectedStrategiesOnly'] as bool? ?? false,
    );
  }
}
