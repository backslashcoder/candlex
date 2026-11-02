import 'package:flutter/material.dart';

import '../formatting/formatters.dart';
import '../models/sector.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Color-graded grid of sector performance tiles. Intensity scales with the
/// magnitude of the average move; green for up, red for down.
class SectorHeatmap extends StatelessWidget {
  const SectorHeatmap({
    super.key,
    required this.sectors,
    this.onTap,
    this.selected,
    this.minTileWidth = 150,
  });

  final List<SectorPerformance> sectors;
  final ValueChanged<SectorPerformance>? onTap;
  final String? selected;
  final double minTileWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final perRow =
          (constraints.maxWidth / minTileWidth).floor().clamp(1, 6);
      const spacing = AppSpacing.sm;
      final tileWidth =
          (constraints.maxWidth - spacing * (perRow - 1)) / perRow;
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          for (final sector in sectors)
            SizedBox(
              width: tileWidth,
              child: _SectorTile(
                sector: sector,
                selected: sector.name == selected,
                onTap: onTap == null ? null : () => onTap!(sector),
              ),
            ),
        ],
      );
    });
  }
}

class _SectorTile extends StatelessWidget {
  const _SectorTile({required this.sector, required this.selected, this.onTap});
  final SectorPerformance sector;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final change = sector.avgChangePercent;
    final intensity = (change.abs() / 2.0).clamp(0.08, 0.9);
    final base = change >= 0 ? AppColors.bullish : AppColors.bearish;
    final bg = Color.alphaBlend(base.withValues(alpha: intensity * 0.3), AppColors.panel);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: selected ? AppColors.accent : base.withValues(alpha: 0.4),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(sector.name,
                      style: AppTypography.numSmall
                          .copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis),
                ),
                Text('#${sector.rank}', style: AppTypography.caption),
              ],
            ),
            const SizedBox(height: 6),
            Text(Formatters.percent(change),
                style: AppTypography.numLarge.copyWith(color: base, fontSize: 16)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('▲${sector.bullishCount}',
                    style: AppTypography.caption
                        .copyWith(color: AppColors.bullish)),
                const SizedBox(width: 8),
                Text('▼${sector.bearishCount}',
                    style: AppTypography.caption
                        .copyWith(color: AppColors.bearish)),
                const Spacer(),
                Text('RS ${sector.relativeStrength.toStringAsFixed(0)}',
                    style: AppTypography.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
