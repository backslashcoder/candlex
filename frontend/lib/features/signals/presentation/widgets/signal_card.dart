import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/trading_signal.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/percentage_change.dart';

/// Compact card summarizing one simulated trading signal.
class TradingSignalCard extends StatelessWidget {
  const TradingSignalCard({super.key, required this.signal, required this.onTap});
  final TradingSignal signal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dirColor =
        signal.direction == Direction.bullish ? AppColors.bullish : AppColors.bearish;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
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
                DirectionPill(signal.direction),
                const SizedBox(width: 8),
                Text(signal.symbol,
                    style: AppTypography.numSmall
                        .copyWith(fontWeight: FontWeight.w700)),
                const Spacer(),
                SignalStatusBadge(signal.status),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(signal.strategy.shortLabel, style: AppTypography.caption),
                const SizedBox(width: 8),
                TagChip(signal.timeframe.label),
                const Spacer(),
                Text(signal.id,
                    style: AppTypography.caption
                        .copyWith(color: AppColors.textTertiary)),
              ],
            ),
            const Divider(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                    child: _kv('Entry',
                        '${Formatters.price(signal.entryLow)}–${Formatters.price(signal.entryHigh)}',
                        AppColors.accent)),
                Expanded(
                    child: _kv('Stop', Formatters.price(signal.stopLoss),
                        AppColors.bearish)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                    child: _kv('T1', Formatters.price(signal.target1),
                        AppColors.bullish)),
                Expanded(
                    child: _kv('T2', Formatters.price(signal.target2),
                        AppColors.bullish)),
                Expanded(
                    child: _kv('R:R', '1:${signal.riskReward.toStringAsFixed(1)}',
                        AppColors.textPrimary)),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            _ConfidenceBar(signal: signal, color: dirColor),
          ],
        ),
      ),
    );
  }

  Widget _kv(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTypography.caption),
        const SizedBox(height: 2),
        Text(value,
            style: AppTypography.numSmall.copyWith(color: color),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class _ConfidenceBar extends StatelessWidget {
  const _ConfidenceBar({required this.signal, required this.color});
  final TradingSignal signal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Simulated heuristic — not a calibrated probability',
      child: Row(
        children: [
          Text('CONFIDENCE', style: AppTypography.caption),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: signal.confidenceScore / 100,
                minHeight: 5,
                backgroundColor: AppColors.surfaceSecondary,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text('${signal.confidenceScore.toStringAsFixed(0)}%',
              style: AppTypography.caption.copyWith(color: color)),
          const SizedBox(width: 2),
          const Icon(Icons.info_outline, size: 11, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
