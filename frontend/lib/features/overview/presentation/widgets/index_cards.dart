import 'package:flutter/material.dart';

import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/market_index.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/percentage_change.dart';

/// Row of compact index summary cards (wraps on narrow screens).
class IndexCards extends StatelessWidget {
  const IndexCards({super.key, required this.indices});
  final List<MarketIndex> indices;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final perRow =
          constraints.maxWidth > 1100 ? 5 : constraints.maxWidth > 720 ? 3 : 2;
      final spacing = AppSpacing.md;
      final cardWidth =
          (constraints.maxWidth - spacing * (perRow - 1)) / perRow;
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          for (final idx in indices)
            SizedBox(width: cardWidth, child: _IndexCard(index: idx)),
        ],
      );
    });
  }
}

class _IndexCard extends StatelessWidget {
  const _IndexCard({required this.index});
  final MarketIndex index;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forChange(index.change);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(index.symbol,
                    style: AppTypography.label
                        .copyWith(color: AppColors.textSecondary),
                    overflow: TextOverflow.ellipsis),
              ),
              Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            index.isVolatilityIndex
                ? index.value.toStringAsFixed(2)
                : Formatters.price(index.value),
            style: AppTypography.numLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ChangeText(index.change,
                  style: AppTypography.caption.copyWith(fontSize: 11)),
              const SizedBox(width: 6),
              PercentageChange(index.changePercent, pill: true, showCaret: false),
            ],
          ),
        ],
      ),
    );
  }
}
