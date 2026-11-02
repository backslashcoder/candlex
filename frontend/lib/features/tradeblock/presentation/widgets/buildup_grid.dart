import 'package:flutter/material.dart';

import '../../../../core/formatting/formatters.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/oi_buildup.dart';
import '../../domain/trade_block_board.dart';
import '../../domain/trade_block_entry.dart';
import 'buildup_style.dart';

/// The middle zone: the four build-up buckets, each a labelled section with a
/// wrap of compact instrument chips. Tapping a chip selects it (lighting its
/// stream in the flow and pinning its setup). Tapping a header filters.
class BuildupGrid extends StatelessWidget {
  const BuildupGrid({
    super.key,
    required this.board,
    required this.selectedSymbol,
    required this.categoryFilter,
    required this.onSelect,
    required this.onCategory,
  });

  final TradeBlockBoard board;
  final String? selectedSymbol;
  final OiBuildup? categoryFilter;
  final ValueChanged<String> onSelect;
  final ValueChanged<OiBuildup> onCategory;

  static const _order = [
    OiBuildup.longBuildup,
    OiBuildup.shortCovering,
    OiBuildup.shortBuildup,
    OiBuildup.longUnwinding,
  ];

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
                const Icon(Icons.widgets_outlined,
                    size: 15, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: Text('OI Build-up', style: AppTypography.h3)),
                if (categoryFilter != null)
                  Text('filtered', style: AppTypography.caption),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.sm),
              children: [
                for (final cat in _order)
                  _CategorySection(
                    category: cat,
                    entries: board.forBuildup(cat),
                    selectedSymbol: selectedSymbol,
                    active: categoryFilter == cat,
                    dimmed: categoryFilter != null && categoryFilter != cat,
                    onSelect: onSelect,
                    onCategory: onCategory,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    required this.category,
    required this.entries,
    required this.selectedSymbol,
    required this.active,
    required this.dimmed,
    required this.onSelect,
    required this.onCategory,
  });

  final OiBuildup category;
  final List<TradeBlockEntry> entries;
  final String? selectedSymbol;
  final bool active;
  final bool dimmed;
  final ValueChanged<String> onSelect;
  final ValueChanged<OiBuildup> onCategory;

  @override
  Widget build(BuildContext context) {
    final color = BuildupStyle.color(category);
    return Opacity(
      opacity: dimmed ? 0.4 : 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => onCategory(category),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  color: active
                      ? BuildupStyle.background(category)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  border: Border.all(
                      color: active ? color.withValues(alpha: 0.5) : Colors.transparent),
                ),
                child: Row(
                  children: [
                    Icon(BuildupStyle.icon(category), size: 13, color: color),
                    const SizedBox(width: 6),
                    Text(category.shortLabel,
                        style: AppTypography.caption.copyWith(
                            color: color, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    Text('${entries.length}',
                        style: AppTypography.numSmall
                            .copyWith(color: AppColors.textSecondary, fontSize: 11)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (entries.isEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 6, bottom: 2),
                child: Text('—', style: AppTypography.caption),
              )
            else
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final e in entries.take(14))
                    _Chip(
                      entry: e,
                      color: color,
                      selected: e.symbol == selectedSymbol,
                      onTap: () => onSelect(e.symbol),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.entry,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final TradeBlockEntry entry;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: selected
              ? BuildupStyle.background(entry.buildup)
              : AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(
            color: selected ? color : AppColors.border,
            width: selected ? 1.2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entry.symbol,
                style: AppTypography.numSmall
                    .copyWith(fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(width: 6),
            Text(Formatters.percent(entry.changePercent),
                style: AppTypography.caption.copyWith(
                    color: AppColors.forChange(entry.changePercent),
                    fontSize: 10)),
            const SizedBox(width: 4),
            Container(width: 1, height: 10, color: AppColors.border),
            const SizedBox(width: 4),
            Text('OI ${Formatters.percent(entry.oiChangePct, decimals: 1)}',
                style: AppTypography.caption.copyWith(color: color, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
