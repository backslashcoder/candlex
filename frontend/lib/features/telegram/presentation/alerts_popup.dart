import 'package:flutter/material.dart';

import '../../../app/di/injector.dart';
import '../../../core/enums.dart';
import '../../../core/formatting/formatters.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/models/alert.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/states.dart';

/// Lightweight notifications popup anchored under the top bar bell.
Future<void> showAlertsPopup(BuildContext context) {
  final alerts = sl<MarketDataStore>().alerts;
  return showDialog<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 56, right: 60),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 340,
            constraints: const BoxConstraints(maxHeight: 420),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              border: Border.all(color: AppColors.border),
              boxShadow: const [
                BoxShadow(color: Colors.black45, blurRadius: 20, offset: Offset(0, 8)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Text('Recent Alerts', style: AppTypography.h3),
                      const Spacer(),
                      const MockDataBadge(compact: true),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Flexible(
                  child: alerts.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(AppSpacing.xl),
                          child: EmptyState(
                            icon: Icons.notifications_off_outlined,
                            title: 'No alerts yet',
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          itemCount: alerts.length.clamp(0, 12),
                          separatorBuilder: (_, _) => const SizedBox(height: 4),
                          itemBuilder: (context, i) => _AlertRow(alert: alerts[i]),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _AlertRow extends StatelessWidget {
  const _AlertRow({required this.alert});
  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final color = switch (alert.direction) {
      Direction.bullish => AppColors.bullish,
      Direction.bearish => AppColors.bearish,
      Direction.neutral => AppColors.textSecondary,
    };
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(alert.kind.label,
                        style: AppTypography.caption.copyWith(color: color)),
                    const Spacer(),
                    Text(Formatters.shortTime(alert.time),
                        style: AppTypography.caption),
                  ],
                ),
                const SizedBox(height: 2),
                Text(alert.message, style: AppTypography.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
