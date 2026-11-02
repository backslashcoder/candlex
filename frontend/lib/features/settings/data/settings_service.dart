import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/app_settings.dart';

/// Holds the current [AppSettings], persists changes locally, and notifies
/// listeners (the app rebuilds theme/format from this).
class SettingsService extends ChangeNotifier {
  SettingsService(this._prefs);

  final SharedPreferences _prefs;
  static const _key = 'candlex.settings.v1';

  AppSettings _settings = const AppSettings();
  AppSettings get settings => _settings;

  void load() {
    final raw = _prefs.getString(_key);
    if (raw != null) {
      try {
        _settings =
            AppSettings.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {
        _settings = const AppSettings();
      }
    }
    notifyListeners();
  }

  Future<void> update(AppSettings settings) async {
    _settings = settings;
    notifyListeners();
    await _prefs.setString(_key, jsonEncode(settings.toJson()));
  }
}
