import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import 'app_sidebar.dart';
import 'market_top_bar.dart';

/// Application shell: persistent top bar + collapsible sidebar wrapping the
/// routed page content. Collapse state lives here so it survives navigation.
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child, required this.currentPath});
  final Widget child;
  final String currentPath;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _collapsed = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final autoCollapse = width < AppSpacing.laptopBreakpoint;
    final isMobile = width < AppSpacing.mobileBreakpoint;
    final collapsed = _collapsed || autoCollapse;

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: isMobile ? _MobileDrawer(currentPath: widget.currentPath) : null,
      body: Column(
        children: [
          Builder(
            builder: (context) => MarketTopBar(
              onToggleSidebar: () {
                if (isMobile) {
                  Scaffold.of(context).openDrawer();
                } else {
                  setState(() => _collapsed = !_collapsed);
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!isMobile)
                  AppSidebar(
                    collapsed: collapsed,
                    currentPath: widget.currentPath,
                  ),
                Expanded(
                  child: ClipRect(child: widget.child),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.currentPath});
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.panel,
      width: AppSpacing.sidebarExpandedWidth,
      child: SafeArea(
        child: AppSidebar(collapsed: false, currentPath: currentPath),
      ),
    );
  }
}
