import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/models/technical_analysis.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/panel.dart';
import '../../../../core/widgets/percentage_change.dart';

/// Technical analysis read-out panel.
class AnalysisPanel extends StatelessWidget {
  const AnalysisPanel({super.key, required this.analysis});
  final TechnicalAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    return TerminalPanel(
      title: 'Technical Analysis',
      headerIcon: Icons.analytics_outlined,
      trailing: DirectionPill(analysis.bias, label: '${analysis.bias.label} bias'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _row('Market Structure', _trendLabel(analysis.trend),
              _trendColor(analysis.trend)),
          _row('Trend Direction', _trendLabel(analysis.trend),
              _trendColor(analysis.trend)),
          _row('Momentum', _momentumLabel(analysis.momentum),
              _momentumColor(analysis.momentum)),
          _row('VWAP Position', _vwapLabel(analysis.vwapPosition),
              _vwapColor(analysis.vwapPosition)),
          _row('Volume', _volumeLabel(analysis.volume), _volumeColor(analysis.volume)),
          _row('Order Block', _obLabel(analysis.orderBlockStatus),
              _obColor(analysis.orderBlockStatus)),
          const SizedBox(height: AppSpacing.sm),
          _note('Structure', analysis.marketStructure),
          const SizedBox(height: AppSpacing.sm),
          _note('Liquidity', analysis.liquidityContext),
        ],
      ),
    );
  }

  Widget _row(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodySmall),
          Text(value, style: AppTypography.numSmall.copyWith(color: color)),
        ],
      ),
    );
  }

  Widget _note(String label, String text) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTypography.caption),
          const SizedBox(height: 3),
          Text(text, style: AppTypography.bodySmall),
        ],
      ),
    );
  }

  String _trendLabel(TrendDirection t) => switch (t) {
        TrendDirection.strongUp => 'Strong Uptrend',
        TrendDirection.up => 'Uptrend',
        TrendDirection.sideways => 'Sideways',
        TrendDirection.down => 'Downtrend',
        TrendDirection.strongDown => 'Strong Downtrend',
      };
  Color _trendColor(TrendDirection t) => switch (t) {
        TrendDirection.strongUp || TrendDirection.up => AppColors.bullish,
        TrendDirection.sideways => AppColors.textSecondary,
        TrendDirection.down || TrendDirection.strongDown => AppColors.bearish,
      };

  String _momentumLabel(MomentumStatus m) => switch (m) {
        MomentumStatus.accelerating => 'Accelerating',
        MomentumStatus.steady => 'Steady',
        MomentumStatus.fading => 'Fading',
        MomentumStatus.weak => 'Weak',
      };
  Color _momentumColor(MomentumStatus m) => switch (m) {
        MomentumStatus.accelerating => AppColors.bullish,
        MomentumStatus.steady => AppColors.accent,
        MomentumStatus.fading => AppColors.warning,
        MomentumStatus.weak => AppColors.bearish,
      };

  String _vwapLabel(VwapPosition v) => switch (v) {
        VwapPosition.above => 'Above VWAP',
        VwapPosition.at => 'At VWAP',
        VwapPosition.below => 'Below VWAP',
      };
  Color _vwapColor(VwapPosition v) => switch (v) {
        VwapPosition.above => AppColors.bullish,
        VwapPosition.at => AppColors.textSecondary,
        VwapPosition.below => AppColors.bearish,
      };

  String _volumeLabel(VolumeStatus v) => switch (v) {
        VolumeStatus.surge => 'Surge',
        VolumeStatus.high => 'High',
        VolumeStatus.normal => 'Normal',
        VolumeStatus.low => 'Low',
      };
  Color _volumeColor(VolumeStatus v) => switch (v) {
        VolumeStatus.surge => AppColors.warning,
        VolumeStatus.high => AppColors.bullish,
        VolumeStatus.normal => AppColors.textSecondary,
        VolumeStatus.low => AppColors.textTertiary,
      };

  String _obLabel(OrderBlockStatus o) => switch (o) {
        OrderBlockStatus.active => 'Active',
        OrderBlockStatus.mitigated => 'Mitigated',
        OrderBlockStatus.none => 'None',
      };
  Color _obColor(OrderBlockStatus o) => switch (o) {
        OrderBlockStatus.active => AppColors.bullish,
        OrderBlockStatus.mitigated => AppColors.warning,
        OrderBlockStatus.none => AppColors.textTertiary,
      };
}
