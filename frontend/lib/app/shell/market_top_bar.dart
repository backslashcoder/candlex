import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/enums.dart';
import '../../core/mock/market_data_store.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/badges.dart';
import '../../features/stock_detail/presentation/stock_detail_entry.dart';
import '../../features/telegram/presentation/alerts_popup.dart';
import '../di/injector.dart';
import 'index_ticker.dart';
import 'live_clock.dart';
import 'market_status_indicator.dart';

/// The top navigation bar: brand, session status, live indices, global
/// search, notifications, clock and profile menu.
class MarketTopBar extends StatefulWidget {
  const MarketTopBar({super.key, required this.onToggleSidebar});
  final VoidCallback onToggleSidebar;

  @override
  State<MarketTopBar> createState() => _MarketTopBarState();
}

class _MarketTopBarState extends State<MarketTopBar> {
  final MarketDataStore _store = sl<MarketDataStore>();
  late StreamSubscription<void> _sub;
  MarketSession _session = MarketSession.open;

  @override
  void initState() {
    super.initState();
    _session = _store.session;
    _sub = _store.ticks.listen((_) {
      if (mounted && _store.session != _session) {
        setState(() => _session = _store.session);
      }
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.sizeOf(context).width < AppSpacing.tabletBreakpoint;
    return Container(
      height: AppSpacing.topBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: const BoxDecoration(
        color: AppColors.panel,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Toggle sidebar',
            onPressed: widget.onToggleSidebar,
            icon: const Icon(Icons.menu, size: 18),
            splashRadius: 18,
          ),
          const _Brand(),
          const SizedBox(width: AppSpacing.lg),
          MarketStatusIndicator(_session),
          const SizedBox(width: AppSpacing.lg),
          if (!narrow)
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: IndexTicker(),
              ),
            )
          else
            const Spacer(),
          const MockDataBadge(compact: true),
          const SizedBox(width: AppSpacing.sm),
          IconButton(
            tooltip: 'Search stocks',
            onPressed: () => showStockSearch(context),
            icon: const Icon(Icons.search, size: 18),
            splashRadius: 18,
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => showAlertsPopup(context),
            icon: const Icon(Icons.notifications_none, size: 18),
            splashRadius: 18,
          ),
          if (!narrow) ...[
            const SizedBox(width: AppSpacing.sm),
            const LiveClock(),
            const SizedBox(width: AppSpacing.md),
          ],
          const _ProfileMenu(),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.bullish, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.candlestick_chart, size: 16, color: Colors.white),
        ),
        const SizedBox(width: AppSpacing.sm),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Candle', style: AppTypography.h2),
              TextSpan(
                  text: 'X',
                  style: AppTypography.h2.copyWith(color: AppColors.accent)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Account',
      offset: const Offset(0, 40),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(Icons.person_outline, size: 16),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Market Analyst', style: AppTypography.h3),
              Text('Research workspace', style: AppTypography.caption),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(value: 'profile', child: Text('Profile')),
        const PopupMenuItem(value: 'settings', child: Text('Preferences')),
        const PopupMenuItem(value: 'signout', child: Text('Sign out')),
      ],
      onSelected: (_) {},
    );
  }
}
