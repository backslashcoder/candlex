import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../router/nav_destinations.dart';

/// Left navigation rail with expanded/collapsed modes and active highlight.
class AppSidebar extends StatelessWidget {
  const AppSidebar({
    super.key,
    required this.collapsed,
    required this.currentPath,
  });

  final bool collapsed;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOut,
      width: collapsed
          ? AppSpacing.sidebarCollapsedWidth
          : AppSpacing.sidebarExpandedWidth,
      decoration: const BoxDecoration(
        color: AppColors.panel,
        border: Border(right: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.sm),
          if (!collapsed)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.xs),
              child: Text('NAVIGATION', style: AppTypography.caption),
            )
          else
            const SizedBox(height: AppSpacing.md),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              children: [
                for (final dest in kNavDestinations)
                  _NavTile(
                    destination: dest,
                    collapsed: collapsed,
                    active: currentPath.startsWith(dest.path),
                    onTap: () => context.go(dest.path),
                  ),
              ],
            ),
          ),
          const Divider(height: 1),
          _Footer(collapsed: collapsed),
        ],
      ),
    );
  }
}

class _NavTile extends StatefulWidget {
  const _NavTile({
    required this.destination,
    required this.collapsed,
    required this.active,
    required this.onTap,
  });

  final NavDestination destination;
  final bool collapsed;
  final bool active;
  final VoidCallback onTap;

  @override
  State<_NavTile> createState() => _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.active;
    final color = active ? AppColors.textPrimary : AppColors.textSecondary;
    final tile = MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(
              horizontal: widget.collapsed ? 0 : AppSpacing.md, vertical: 9),
          decoration: BoxDecoration(
            color: active
                ? AppColors.accent.withValues(alpha: 0.12)
                : _hover
                    ? AppColors.surfaceSecondary
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            border: Border.all(
              color: active
                  ? AppColors.accent.withValues(alpha: 0.35)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisAlignment: widget.collapsed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(widget.destination.icon,
                  size: 17, color: active ? AppColors.accent : color),
              if (!widget.collapsed) ...[
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    widget.destination.label,
                    style: AppTypography.body.copyWith(
                      color: color,
                      fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
    if (widget.collapsed) {
      return Tooltip(message: widget.destination.label, child: tile);
    }
    return tile;
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.collapsed});
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    if (collapsed) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.sm),
        child: Icon(Icons.verified_outlined, size: 16, color: AppColors.bullish),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CandleX Terminal', style: AppTypography.caption),
          const SizedBox(height: 2),
          Text('Research · Simulated',
              style: AppTypography.caption.copyWith(color: AppColors.textTertiary)),
        ],
      ),
    );
  }
}
