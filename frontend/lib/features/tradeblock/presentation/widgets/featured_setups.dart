import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/states.dart';
import '../../domain/oi_buildup.dart';
import '../../domain/trade_block_entry.dart';
import 'buildup_style.dart';
import 'mini_sparkline.dart';

/// The right zone: high-conviction setup cards with a sparkline and the
/// demand/supply levels a trader would mark up. Tapping a card opens the full
/// stock-detail chart workspace.
class FeaturedSetups extends StatelessWidget {
  const FeaturedSetups({
    super.key,
    required this.entries,
    required this.selectedSymbol,
    required this.onSelect,
    required this.onOpen,
  });

  final List<TradeBlockEntry> entries;
  final String? selectedSymbol;
  final ValueChanged<String> onSelect;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.auto_graph_outlined,
                    size: 15, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: Text('Featured Setups', style: AppTypography.h3)),
                Text('${entries.length}', style: AppTypography.caption),
              ],
            ),
          ),
          Expanded(
            child: entries.isEmpty
                ? const EmptyState(
                    icon: Icons.inbox_outlined,
                    title: 'No setups',
                    message: 'No build-up setups match the current filter.',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    itemCount: entries.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (context, i) {
                      final e = entries[i];
                      return _SetupCard(
                        entry: e,
                        selected: e.symbol == selectedSymbol,
                        onSelect: () => onSelect(e.symbol),
                        onOpen: () => onOpen(e.symbol),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _SetupCard extends StatelessWidget {
  const _SetupCard({
    required this.entry,
    required this.selected,
    required this.onSelect,
    required this.onOpen,
  });

  final TradeBlockEntry entry;
  final bool selected;
  final VoidCallback onSelect;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final isBull = entry.direction == Direction.bullish;
    final color = isBull ? AppColors.bullish : AppColors.bearish;
    final buildupColor = BuildupStyle.color(entry.buildup);

    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: selected ? color : AppColors.border,
            width: selected ? 1.3 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Direction banner.
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 7),
              color: (isBull ? AppColors.bullishBackground : AppColors.bearishBackground),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(isBull ? 'BULLISH' : 'BEARISH',
                        style: AppTypography.caption.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4)),
                  ),
                  const SizedBox(width: 8),
                  Text(entry.symbol,
                      style: AppTypography.num
                          .copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(entry.name,
                        style: AppTypography.caption,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(Formatters.price(entry.ltp),
                      style: AppTypography.numSmall),
                  const SizedBox(width: 6),
                  Text(Formatters.percent(entry.changePercent),
                      style: AppTypography.numSmall
                          .copyWith(color: color, fontSize: 11)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(BuildupStyle.icon(entry.buildup),
                          size: 13, color: buildupColor),
                      const SizedBox(width: 5),
                      Text(entry.buildup.shortLabel,
                          style: AppTypography.caption.copyWith(
                              color: buildupColor, fontWeight: FontWeight.w700)),
                      const Spacer(),
                      Text('OI ${Formatters.percent(entry.oiChangePct, decimals: 1)}',
                          style: AppTypography.caption
                              .copyWith(color: buildupColor)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  MiniSparkline(
                    seedKey: entry.symbol,
                    changePercent: entry.changePercent,
                    color: color,
                    height: 34,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _levels(isBull),
                  const SizedBox(height: 6),
                  _pivots(),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(entry.buildup.interpretation,
                          style: AppTypography.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      const Spacer(),
                      InkWell(
                        onTap: onOpen,
                        borderRadius: BorderRadius.circular(3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Chart',
                                  style: AppTypography.caption
                                      .copyWith(color: AppColors.accent)),
                              const SizedBox(width: 3),
                              const Icon(Icons.open_in_full,
                                  size: 11, color: AppColors.accent),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _levels(bool isBull) {
    // Bullish reads support -> zone -> resistance; bearish flips the emphasis.
    final cells = isBull
        ? [
            _cell('SUPPORT', Formatters.price(entry.support), AppColors.bearish),
            _cell('ZONE',
                '${Formatters.priceWhole(entry.zoneLow)}–${Formatters.priceWhole(entry.zoneHigh)}',
                AppColors.accent),
            _cell('RESIST', Formatters.price(entry.resistance1), AppColors.bullish),
            _cell('R:R', '1:${entry.riskReward.toStringAsFixed(1)}',
                AppColors.textPrimary),
          ]
        : [
            _cell('RESIST', Formatters.price(entry.resistance1), AppColors.bearish),
            _cell('ZONE',
                '${Formatters.priceWhole(entry.zoneLow)}–${Formatters.priceWhole(entry.zoneHigh)}',
                AppColors.accent),
            _cell('SUPPORT', Formatters.price(entry.support), AppColors.bullish),
            _cell('R:R', '1:${entry.riskReward.toStringAsFixed(1)}',
                AppColors.textPrimary),
          ];
    return Row(children: [for (final c in cells) Expanded(child: c)]);
  }

  Widget _pivots() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          _pivot('S1', entry.support, AppColors.bearish),
          _pivot('VWAP', entry.vwap, AppColors.textSecondary),
          _pivot('R1', entry.resistance1, AppColors.bullish),
          _pivot('R2', entry.resistance2, AppColors.bullish),
        ],
      ),
    );
  }

  Widget _pivot(String label, double value, Color color) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$label ',
              style: AppTypography.caption.copyWith(color: AppColors.textTertiary)),
          Flexible(
            child: Text(Formatters.priceWhole(value),
                style: AppTypography.caption.copyWith(color: color),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget _cell(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.caption),
        const SizedBox(height: 1),
        Text(value,
            style: AppTypography.numSmall.copyWith(color: color, fontSize: 11),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
