import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/settings/data/settings_service.dart';
import 'di/injector.dart';
import 'router/app_router.dart';

/// Root application widget. Rebuilds on settings changes (e.g. theme).
class CandleXApp extends StatefulWidget {
  const CandleXApp({super.key});

  @override
  State<CandleXApp> createState() => _CandleXAppState();
}

class _CandleXAppState extends State<CandleXApp> {
  final SettingsService _settings = sl<SettingsService>();

  @override
  void initState() {
    super.initState();
    _settings.addListener(_onSettings);
  }

  void _onSettings() => setState(() {});

  @override
  void dispose() {
    _settings.removeListener(_onSettings);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CandleX · Market Intelligence Terminal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
