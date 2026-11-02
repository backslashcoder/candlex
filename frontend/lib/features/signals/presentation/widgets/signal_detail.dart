import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/trading_signal.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/percentage_change.dart';
import '../../../stock_detail/presentation/stock_detail_entry.dart';

Future<void> showSignalDetail(BuildContext context, TradingSignal signal) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => _SignalDetailDialog(signal: signal),
  );
}

class _SignalDetailDialog extends StatelessWidget {
  const _SignalDetailDialog({required this.signal});
  final TradingSignal signal;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.panel,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        side: const BorderSide(color: AppColors.border),
      ),
      child: SizedBox(
        width: 480,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  DirectionPill(signal.direction),
                  const SizedBox(width: 8),
                  Text(signal.symbol, style: AppTypography.h1),
                  const Spacer(),
                  SignalStatusBadge(signal.status),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, size: 18),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      _tag('Strategy', signal.strategy.label),
                      _tag('Timeframe', signal.timeframe.label),
                      _tag('Signal ID', signal.id),
                      _tag('Created', Formatters.dateTime(signal.createdAt)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _row('Entry Zone',
                      '${Formatters.price(signal.entryLow)} – ${Formatters.price(signal.entryHigh)}',
                      AppColors.accent),
                  _row('Stop-loss', Formatters.price(signal.stopLoss),
                      AppColors.bearish),
                  _row('Target 1', Formatters.price(signal.target1),
                      AppColors.bullish),
                  _row('Target 2', Formatters.price(signal.target2),
                      AppColors.bullish),
                  _row('Risk / Reward', '1 : ${signal.riskReward.toStringAsFixed(2)}',
                      AppColors.textPrimary),
                  _row('Live Price', Formatters.price(signal.currentPrice),
                      AppColors.textPrimary),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceSecondary,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('CONFIDENCE ${signal.confidenceScore.toStringAsFixed(0)}%',
                                style: AppTypography.caption
                                    .copyWith(color: AppColors.accent)),
                            const SizedBox(width: 6),
                            Text('· simulated heuristic',
                                style: AppTypography.caption),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text('REASONING', style: AppTypography.caption),
                        const SizedBox(height: 3),
                        Text(signal.reasoning, style: AppTypography.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showStockDetail(context, signal.symbol);
                          },
                          icon: const Icon(Icons.candlestick_chart, size: 15),
                          label: const Text('Open chart'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Simulated analytical output — not financial advice. Place orders through your own broker.',
                    style: AppTypography.caption
                        .copyWith(color: AppColors.textTertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, Color color) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTypography.bodySmall),
            Text(value, style: AppTypography.num.copyWith(color: color)),
          ],
        ),
      );

  Widget _tag(String label, String value) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(), style: AppTypography.caption),
            Text(value, style: AppTypography.numSmall),
          ],
        ),
      );
}
