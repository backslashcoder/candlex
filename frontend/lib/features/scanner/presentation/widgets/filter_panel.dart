import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/inputs.dart';
import '../../../../core/widgets/panel.dart';
import '../../domain/scanner_filter.dart';

/// Advanced multi-constraint filter panel for the scanner.
class FilterPanel extends StatelessWidget {
  const FilterPanel({
    super.key,
    required this.filter,
    required this.sectors,
    required this.onChanged,
    required this.onReset,
  });

  final ScannerFilter filter;
  final List<String> sectors;
  final ValueChanged<ScannerFilter> onChanged;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return TerminalPanel(
      title: 'Filters',
      headerIcon: Icons.tune,
      trailing: filter.hasActiveConstraints
          ? GestureDetector(
              onTap: onReset,
              child: Text('Reset',
                  style: AppTypography.caption.copyWith(color: AppColors.accent)),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _label('Exchange'),
          CompactDropdown<Exchange?>(
            value: filter.exchange,
            width: double.infinity,
            items: [null, ...Exchange.values],
            labelOf: (e) => e?.name.toUpperCase() ?? 'All',
            onChanged: (v) => onChanged(v == null
                ? filter.copyWith(clearExchange: true)
                : filter.copyWith(exchange: v)),
          ),
          _label('Sector'),
          CompactDropdown<String?>(
            value: filter.sector,
            width: double.infinity,
            items: [null, ...sectors],
            labelOf: (s) => s ?? 'All sectors',
            onChanged: (v) => onChanged(v == null
                ? filter.copyWith(clearSector: true)
                : filter.copyWith(sector: v)),
          ),
          _label('Direction'),
          CompactDropdown<Direction?>(
            value: filter.direction,
            width: double.infinity,
            items: const [null, Direction.bullish, Direction.bearish, Direction.neutral],
            labelOf: (d) => d?.label ?? 'Any',
            onChanged: (v) => onChanged(v == null
                ? filter.copyWith(clearDirection: true)
                : filter.copyWith(direction: v)),
          ),
          const SizedBox(height: AppSpacing.sm),
          _SliderRow(
            label: 'Min Strength',
            value: filter.minStrength,
            max: 100,
            suffix: '',
            onChanged: (v) => onChanged(filter.copyWith(minStrength: v)),
          ),
          _SliderRow(
            label: 'Min Liquidity',
            value: filter.minLiquidity,
            max: 100,
            suffix: '',
            onChanged: (v) => onChanged(filter.copyWith(minLiquidity: v)),
          ),
          _SliderRow(
            label: 'Min Volume Ratio',
            value: filter.minVolumeRatio,
            max: 3,
            decimals: 1,
            suffix: 'x',
            onChanged: (v) => onChanged(filter.copyWith(minVolumeRatio: v)),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.sm, bottom: 4),
        child: Text(text.toUpperCase(), style: AppTypography.caption),
      );
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.max,
    required this.onChanged,
    this.suffix = '',
    this.decimals = 0,
  });

  final String label;
  final double value;
  final double max;
  final ValueChanged<double> onChanged;
  final String suffix;
  final int decimals;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label.toUpperCase(), style: AppTypography.caption),
            Text('${value.toStringAsFixed(decimals)}$suffix',
                style: AppTypography.caption.copyWith(color: AppColors.accent)),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 3,
            activeTrackColor: AppColors.accent,
            inactiveTrackColor: AppColors.surfaceSecondary,
            thumbColor: AppColors.accent,
            overlayShape: SliderComponentShape.noOverlay,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          ),
          child: Slider(
            value: value.clamp(0, max),
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
