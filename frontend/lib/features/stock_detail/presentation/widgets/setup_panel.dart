import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/models/technical_analysis.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/seeded_random.dart';
import '../../../../core/widgets/panel.dart';
import '../../../../core/widgets/percentage_change.dart';

/// Simulated trading setup derived from the stock + analysis. Clearly labelled
/// as an analytical example, NOT financial advice.
class SetupPanel extends StatelessWidget {
  const SetupPanel({super.key, required this.stock, required this.analysis});
  final Stock stock;
  final TechnicalAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final rng = SeededRandom(stableHash('setup-${stock.symbol}'));
    final isLong = analysis.bias != Direction.bearish;
    final mid = stock.ltp;
    final band = mid * rng.range(0.002, 0.005);
    final risk = mid * rng.range(0.007, 0.013);
    final r1 = risk * rng.range(1.4, 2.0);
    final r2 = r1 * rng.range(1.4, 1.9);
    final entryLow = mid - band;
    final entryHigh = mid + band;
    final sl = isLong ? mid - risk : mid + risk;
    final t1 = isLong ? mid + r1 : mid - r1;
    final t2 = isLong ? mid + r2 : mid - r2;
    final rr = risk == 0 ? 0 : r1 / risk;
    final strategy = _strategyFor(analysis);
    final direction = isLong ? Direction.bullish : Direction.bearish;

    return TerminalPanel(
      title: 'Trading Setup',
      headerIcon: Icons.account_tree_outlined,
      trailing: DirectionPill(direction,
          label: isLong ? 'LONG' : 'SHORT'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _rowRange('Entry Zone',
              '${Formatters.price(entryLow)} – ${Formatters.price(entryHigh)}',
              AppColors.accent),
          _row('Stop-loss', Formatters.price(sl), AppColors.bearish),
          _row('Target 1', Formatters.price(t1), AppColors.bullish),
          _row('Target 2', Formatters.price(t2), AppColors.bullish),
          _row('Risk / Reward', '1 : ${rr.toStringAsFixed(2)}',
              AppColors.textPrimary),
          const Divider(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(child: _meta('Strategy', strategy.label)),
              Expanded(child: _meta('Timeframe', analysis.symbol == '' ? '' : '15m')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _meta('Validity', 'Intraday')),
              Expanded(
                child: _meta('Setup', analysis.orderBlockStatus == OrderBlockStatus.active
                    ? 'Valid'
                    : 'Watch')),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('REASONING', style: AppTypography.caption),
                const SizedBox(height: 3),
                Text(_reasoning(strategy, direction), style: AppTypography.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.warningBackground,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              border: Border.all(color: AppColors.warning.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_amber_rounded,
                    size: 14, color: AppColors.warning),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Simulated analytical example — not financial advice. '
                    'Place orders through your own broker.',
                    style: AppTypography.caption
                        .copyWith(color: AppColors.warning),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  StrategyType _strategyFor(TechnicalAnalysis a) {
    if (a.orderBlockStatus == OrderBlockStatus.active) {
      return StrategyType.orderBlockRetest;
    }
    if (a.volume == VolumeStatus.surge) return StrategyType.momentumBreakout;
    if (a.vwapPosition != VwapPosition.at) {
      return StrategyType.vwapTrendContinuation;
    }
    return StrategyType.openingRangeBreakout;
  }

  String _reasoning(StrategyType s, Direction d) {
    final dir = d == Direction.bullish ? 'long' : 'short';
    return switch (s) {
      StrategyType.orderBlockRetest =>
        'Active order block supports a $dir on retest; defined risk below/above the block.',
      StrategyType.momentumBreakout =>
        'Volume surge with ${stock.strengthScore.toStringAsFixed(0)} strength favors a $dir momentum continuation.',
      StrategyType.vwapTrendContinuation =>
        'Price respecting VWAP with trend intact; $dir on pullback into the mean.',
      StrategyType.openingRangeBreakout =>
        'Opening-range break with participation supports a $dir bias intraday.',
      StrategyType.liquiditySweepReversal =>
        'Liquidity sweep then reclaim signals a $dir reversal.',
    };
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

  Widget _rowRange(String label, String value, Color color) => _row(label, value, color);

  Widget _meta(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTypography.caption),
          const SizedBox(height: 2),
          Text(value, style: AppTypography.numSmall),
        ],
      ),
    );
  }
}
