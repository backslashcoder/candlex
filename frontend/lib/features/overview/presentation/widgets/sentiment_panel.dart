import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/models/market_overview.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/breadth_bar.dart';
import '../../../../core/widgets/panel.dart';

/// Market sentiment summary: gauge, A/D ratio, counts, participation, leaders.
class SentimentPanel extends StatelessWidget {
  const SentimentPanel({super.key, required this.overview});
  final MarketOverview overview;

  @override
  Widget build(BuildContext context) {
    final breadth = overview.breadth;
    final color = switch (overview.sentiment) {
      Direction.bullish => AppColors.bullish,
      Direction.bearish => AppColors.bearish,
      Direction.neutral => AppColors.warning,
    };
    return TerminalPanel(
      title: 'Market Sentiment',
      headerIcon: Icons.speed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              _Gauge(sentiment: overview.sentiment, color: color),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(overview.sentiment.label.toUpperCase(),
                        style: AppTypography.h2.copyWith(color: color)),
                    const SizedBox(height: 2),
                    Text(
                      'A/D ratio ${breadth.advanceDeclineRatio.toStringAsFixed(2)}',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          BreadthBar(positive: breadth.advances, negative: breadth.declines, neutral: breadth.unchanged),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _Stat('Bullish', '${breadth.advances}', AppColors.bullish),
              _Stat('Bearish', '${breadth.declines}', AppColors.bearish),
              _Stat('Participation', '${overview.participation.toStringAsFixed(0)}%',
                  AppColors.accent),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _Leaders(
              leading: overview.leadingSector, weakest: overview.weakestSector),
        ],
      ),
    );
  }
}

class _Gauge extends StatelessWidget {
  const _Gauge({required this.sentiment, required this.color});
  final Direction sentiment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final icon = switch (sentiment) {
      Direction.bullish => Icons.trending_up,
      Direction.bearish => Icons.trending_down,
      Direction.neutral => Icons.trending_flat,
    };
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.45), width: 2),
      ),
      child: Icon(icon, color: color, size: 26),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.label, this.value, this.color);
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTypography.caption),
          const SizedBox(height: 2),
          Text(value, style: AppTypography.num.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _Leaders extends StatelessWidget {
  const _Leaders({required this.leading, required this.weakest});
  final String leading;
  final String weakest;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _LeaderTile(
              label: 'Leading sector', value: leading, color: AppColors.bullish),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _LeaderTile(
              label: 'Weakest sector', value: weakest, color: AppColors.bearish),
        ),
      ],
    );
  }
}

class _LeaderTile extends StatelessWidget {
  const _LeaderTile(
      {required this.label, required this.value, required this.color});
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTypography.caption),
          const SizedBox(height: 3),
          Text(value,
              style: AppTypography.num.copyWith(color: color),
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
