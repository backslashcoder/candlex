import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/market_breadth/presentation/market_breadth_page.dart';
import '../../features/overview/presentation/overview_page.dart';
import '../../features/scanner/presentation/scanner_page.dart';
import '../../features/sectors/presentation/sectors_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import '../../features/signals/presentation/signals_page.dart';
import '../../features/telegram/presentation/telegram_page.dart';
import '../../features/tradeblock/presentation/tradeblock_page.dart';
import '../../features/watchlists/presentation/watchlists_page.dart';
import '../shell/app_shell.dart';

/// Central GoRouter. A ShellRoute keeps the top bar + sidebar mounted across
/// navigation so their state (and the simulator subscriptions) persist.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/overview',
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(currentPath: state.uri.path, child: child),
        routes: [
          GoRoute(
            path: '/overview',
            pageBuilder: (c, s) => _noTransition(const OverviewPage()),
          ),
          GoRoute(
            path: '/scanner',
            pageBuilder: (c, s) => _noTransition(const ScannerPage()),
          ),
          GoRoute(
            path: '/breadth',
            pageBuilder: (c, s) => _noTransition(const MarketBreadthPage()),
          ),
          GoRoute(
            path: '/sectors',
            pageBuilder: (c, s) => _noTransition(const SectorsPage()),
          ),
          GoRoute(
            path: '/signals',
            pageBuilder: (c, s) => _noTransition(const SignalsPage()),
          ),
          GoRoute(
            path: '/tradeblock',
            pageBuilder: (c, s) => _noTransition(const TradeBlockPage()),
          ),
          GoRoute(
            path: '/watchlists',
            pageBuilder: (c, s) => _noTransition(const WatchlistsPage()),
          ),
          GoRoute(
            path: '/telegram',
            pageBuilder: (c, s) => _noTransition(const TelegramPage()),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (c, s) => _noTransition(const SettingsPage()),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<void> _noTransition(Widget child) {
    return CustomTransitionPage<void>(
      child: child,
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (c, animation, s, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
