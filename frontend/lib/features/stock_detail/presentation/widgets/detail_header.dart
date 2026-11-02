import 'package:flutter/material.dart';

import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/percentage_change.dart';
import '../../../../core/widgets/score_indicator.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.stock, required this.onClose});
  final Stock stock;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.sm,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(stock.symbol, style: AppTypography.h1),
                        const SizedBox(width: 8),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceSecondary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(stock.exchange.name.toUpperCase(),
                              style: AppTypography.caption),
                        ),
                      ],
                    ),
                    Text('${stock.name} · ${stock.sector}',
                        style: AppTypography.bodySmall),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Formatters.currency(stock.ltp),
                        style: AppTypography.numLarge),
                    Row(
                      children: [
                        ChangeText(stock.change,
                            style: AppTypography.caption),
                        const SizedBox(width: 6),
                        PercentageChange(stock.changePercent, pill: true),
                      ],
                    ),
                  ],
                ),
                _ScoreBlock(label: 'Strength', child: StrengthIndicator(stock.strengthScore)),
                _ScoreBlock(label: 'Liquidity', child: LiquidityIndicator(stock.liquidityScore)),
                _ScoreBlock(
                  label: 'Vol Ratio',
                  child: Text(Formatters.ratio(stock.volumeRatio, decimals: 1),
                      style: AppTypography.num.copyWith(
                          color: stock.volumeRatio > 1.5
                              ? AppColors.warning
                              : AppColors.textPrimary)),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 18),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }
}

class _ScoreBlock extends StatelessWidget {
  const _ScoreBlock({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label.toUpperCase(), style: AppTypography.caption),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
