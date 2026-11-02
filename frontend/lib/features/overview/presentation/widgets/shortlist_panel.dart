import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/panel.dart';
import '../../../../core/widgets/percentage_change.dart';
import '../../../../core/widgets/score_indicator.dart';
import '../../../stock_detail/presentation/stock_detail_entry.dart';

/// Curated shortlist: top candidates per direction. This is a RANKING, not a
/// trade recommendation — made explicit in the footer note.
class ShortlistPanel extends StatelessWidget {
  const ShortlistPanel({
    super.key,
    required this.bullish,
    required this.bearish,
  });

  final List<Stock> bullish;
  final List<Stock> bearish;

  @override
  Widget build(BuildContext context) {
    final topBull = bullish.take(3).toList();
    final topBear = bearish.take(3).toList();
    final sectors = {...topBull, ...topBear}.map((s) => s.sector).toSet();

    return TerminalPanel(
      title: 'Shortlist',
      headerIcon: Icons.playlist_add_check,
      trailing: TagChip('${sectors.length} sectors', color: AppColors.accent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _group(context, 'Top Bullish Candidates', topBull, Direction.bullish),
          const SizedBox(height: AppSpacing.md),
          _group(context, 'Top Bearish Candidates', topBear, Direction.bearish),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: 13, color: AppColors.textTertiary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Rankings by simulated strength — not trade recommendations.',
                    style: AppTypography.caption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _group(
      BuildContext context, String title, List<Stock> stocks, Direction dir) {
    final color = dir == Direction.bullish ? AppColors.bullish : AppColors.bearish;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title.toUpperCase(),
            style: AppTypography.caption.copyWith(color: color)),
        const SizedBox(height: AppSpacing.sm),
        for (final s in stocks) _ShortlistTile(stock: s, direction: dir),
      ],
    );
  }
}

class _ShortlistTile extends StatelessWidget {
  const _ShortlistTile({required this.stock, required this.direction});
  final Stock stock;
  final Direction direction;

  String get _reason {
    if (stock.volumeRatio > 1.5) {
      return 'Volume ${Formatters.ratio(stock.volumeRatio, decimals: 1)} avg · strength ${stock.strengthScore.toStringAsFixed(0)}';
    }
    if (stock.isNearVwap) return 'Holding VWAP · strength ${stock.strengthScore.toStringAsFixed(0)}';
    return '${stock.sector} · strength ${stock.strengthScore.toStringAsFixed(0)}';
  }

  String get _setup => switch (stock.orderBlockStatus) {
        OrderBlockStatus.active => 'OB active',
        OrderBlockStatus.mitigated => 'OB mitigated',
        OrderBlockStatus.none => 'No setup',
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showStockDetail(context, stock.symbol),
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(stock.symbol,
                          style: AppTypography.numSmall
                              .copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 6),
                      PercentageChange(stock.changePercent),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(_reason,
                      style: AppTypography.caption, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StrengthIndicator(stock.strengthScore, width: 40),
                  const SizedBox(height: 4),
                  TagChip(_setup),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
