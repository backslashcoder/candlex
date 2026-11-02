import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/settings_service.dart';
import '../../domain/app_settings.dart';

/// Exposes [AppSettings] as cubit state and persists every change. Shared by
/// the Settings and Telegram screens (telegram preferences live in settings).
class SettingsCubit extends Cubit<AppSettings> {
  SettingsCubit(this._service) : super(_service.settings);

  final SettingsService _service;

  void update(AppSettings settings) {
    emit(settings);
    _service.update(settings);
  }

  void connectTelegram(bool connected) =>
      update(state.copyWith(telegramConnected: connected));
}
