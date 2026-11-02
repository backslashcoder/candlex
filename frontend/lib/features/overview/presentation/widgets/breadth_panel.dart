import 'package:flutter/material.dart';

import '../../../../core/models/market_breadth.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/breadth_bar.dart';
import '../../../../core/widgets/panel.dart';

/// Compact market-breadth visualization for the overview screen.
class BreadthPanel extends StatelessWidget {
  const BreadthPanel({super.key, required this.breadth});
  final MarketBreadth breadth;

  @override
  Widget build(BuildContext context) {
    return TerminalPanel(
      title: 'Market Breadth',
      headerIcon: Icons.equalizer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BreadthBar(positive: breadth.advances, negative: breadth.declines, neutral: breadth.unchanged),
          const SizedBox(height: AppSpacing.md),
          BreadthBar(
            positive: breadth.aboveVwap,
            negative: breadth.belowVwap,
            positiveLabel: 'Above VWAP',
            negativeLabel: 'Below VWAP',
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                    'New Highs', '${breadth.newHighs}', AppColors.bullish),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child:
                    _MiniStat('New Lows', '${breadth.newLows}', AppColors.bearish),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text('STRENGTH DISTRIBUTION', style: AppTypography.caption),
          const SizedBox(height: AppSpacing.sm),
          _StrengthHistogram(distribution: breadth.strengthDistribution),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat(this.label, this.value, this.color);
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label.toUpperCase(), style: AppTypography.caption),
          Text(value, style: AppTypography.num.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _StrengthHistogram extends StatelessWidget {
  const _StrengthHistogram({required this.distribution});
  final List<int> distribution;

  @override
  Widget build(BuildContext context) {
    if (distribution.isEmpty) return const SizedBox.shrink();
    final maxVal = distribution.reduce((a, b) => a > b ? a : b).clamp(1, 1 << 30);
    const labels = ['0-20', '20-40', '40-60', '60-80', '80-100'];
    final colors = [
      AppColors.bearish,
      AppColors.bearishMuted,
      AppColors.warning,
      AppColors.bullishMuted,
      AppColors.bullish,
    ];
    return SizedBox(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (int i = 0; i < distribution.length; i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${distribution[i]}',
                        style: AppTypography.caption
                            .copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 3),
                    Container(
                      height: (distribution[i] / maxVal * 40).clamp(2, 40),
                      decoration: BoxDecoration(
                        color: colors[i],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(labels[i],
                        style: AppTypography.caption.copyWith(fontSize: 8)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
