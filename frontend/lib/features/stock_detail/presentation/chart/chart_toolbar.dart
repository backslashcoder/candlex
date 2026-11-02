import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import 'chart_config.dart';

/// Timeframe selector + overlay toggles for the chart.
class ChartToolbar extends StatelessWidget {
  const ChartToolbar({
    super.key,
    required this.timeframe,
    required this.onTimeframe,
    required this.config,
    required this.onConfig,
  });

  final Timeframe timeframe;
  final ValueChanged<Timeframe> onTimeframe;
  final ChartOverlayConfig config;
  final ValueChanged<ChartOverlayConfig> onConfig;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeframeSelector(value: timeframe, onChanged: onTimeframe),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _toggle('VWAP', config.showVwap, AppColors.accent,
                (v) => onConfig(config.copyWith(showVwap: v))),
            _toggle('EMA 9', config.showEma9, AppColors.warning,
                (v) => onConfig(config.copyWith(showEma9: v))),
            _toggle('EMA 21', config.showEma21, const Color(0xFFB07BE8),
                (v) => onConfig(config.copyWith(showEma21: v))),
            _toggle('Order Blocks', config.showOrderBlocks, AppColors.bullish,
                (v) => onConfig(config.copyWith(showOrderBlocks: v))),
            _toggle('Liquidity', config.showLiquidity, AppColors.textSecondary,
                (v) => onConfig(config.copyWith(showLiquidity: v))),
            _toggle('Volume', config.showVolume, AppColors.neutral,
                (v) => onConfig(config.copyWith(showVolume: v))),
          ],
        ),
      ],
    );
  }

  Widget _toggle(String label, bool active, Color color, ValueChanged<bool> onTap) {
    return _OverlayToggle(label: label, active: active, color: color, onTap: onTap);
  }
}

class _OverlayToggle extends StatelessWidget {
  const _OverlayToggle({
    required this.label,
    required this.active,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool active;
  final Color color;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(!active),
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: active ? color.withValues(alpha: 0.14) : AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(
              color: active ? color.withValues(alpha: 0.6) : AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? color : AppColors.textTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            Text(label,
                style: AppTypography.caption.copyWith(
                  color: active ? AppColors.textPrimary : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}

/// Segmented timeframe control.
class TimeframeSelector extends StatelessWidget {
  const TimeframeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Timeframe value;
  final ValueChanged<Timeframe> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final tf in Timeframe.values)
            GestureDetector(
              onTap: () => onChanged(tf),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: tf == value ? AppColors.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Text(
                  tf.label,
                  style: AppTypography.caption.copyWith(
                    color: tf == value ? Colors.white : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
