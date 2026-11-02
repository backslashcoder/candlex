import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/formatting/formatters.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/percentage_change.dart';
import '../../../stock_detail/presentation/stock_detail_entry.dart';

/// Interactive scatter: X = % change, Y = relative strength. Each dot is a
/// stock; tap to open its chart, hover to inspect.
class BreadthScatter extends StatefulWidget {
  const BreadthScatter({super.key, required this.stocks});
  final List<Stock> stocks;

  @override
  State<BreadthScatter> createState() => _BreadthScatterState();
}

class _BreadthScatterState extends State<BreadthScatter> {
  int? _hovered;

  @override
  Widget build(BuildContext context) {
    final stocks = widget.stocks;
    if (stocks.isEmpty) {
      return const SizedBox(height: 300);
    }
    double maxX = 0.5, minX = -0.5;
    for (final s in stocks) {
      if (s.changePercent > maxX) maxX = s.changePercent;
      if (s.changePercent < minX) minX = s.changePercent;
    }
    maxX = (maxX + 0.5).ceilToDouble();
    minX = (minX - 0.5).floorToDouble();

    final spots = [
      for (final s in stocks)
        ScatterSpot(
          s.changePercent,
          s.strengthScore,
          dotPainter: FlDotCirclePainter(
            color: (s.direction == Direction.bullish
                    ? AppColors.bullish
                    : s.direction == Direction.bearish
                        ? AppColors.bearish
                        : AppColors.textSecondary)
                .withValues(alpha: 0.8),
            radius: 5,
          ),
        ),
    ];

    final hoveredStock =
        _hovered != null && _hovered! < stocks.length ? stocks[_hovered!] : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Readout(stock: hoveredStock),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 360,
          child: ScatterChart(
            ScatterChartData(
              minX: minX,
              maxX: maxX,
              minY: 0,
              maxY: 100,
              scatterSpots: spots,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 20,
                verticalInterval: ((maxX - minX) / 6).clamp(0.5, 100),
                getDrawingHorizontalLine: (_) =>
                    const FlLine(color: AppColors.gridLine, strokeWidth: 0.5),
                getDrawingVerticalLine: (v) => FlLine(
                  color: v.abs() < 0.01 ? AppColors.border : AppColors.gridLine,
                  strokeWidth: v.abs() < 0.01 ? 1 : 0.5,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  axisNameWidget:
                      Text('Relative Strength', style: AppTypography.caption),
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    reservedSize: 28,
                    getTitlesWidget: (v, _) => Text(v.toStringAsFixed(0),
                        style: AppTypography.caption),
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget:
                      Text('Change %', style: AppTypography.caption),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24,
                    getTitlesWidget: (v, _) => Text(v.toStringAsFixed(1),
                        style: AppTypography.caption),
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: AppColors.border),
              ),
              scatterTouchData: ScatterTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback: (event, response) {
                  final idx = response?.touchedSpot?.spotIndex;
                  if (idx != _hovered) setState(() => _hovered = idx);
                  if (event is FlTapUpEvent &&
                      idx != null &&
                      idx < stocks.length) {
                    showStockDetail(context, stocks[idx].symbol);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Readout extends StatelessWidget {
  const _Readout({this.stock});
  final Stock? stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      alignment: Alignment.centerLeft,
      child: stock == null
          ? Text('Hover a point to inspect · tap to open chart',
              style: AppTypography.caption)
          : Row(
              children: [
                Text(stock!.symbol,
                    style: AppTypography.numSmall
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(width: 10),
                PercentageChange(stock!.changePercent),
                const SizedBox(width: 12),
                Text('Strength ${stock!.strengthScore.toStringAsFixed(0)}',
                    style: AppTypography.caption),
                const SizedBox(width: 12),
                Text(stock!.sector, style: AppTypography.caption),
                const Spacer(),
                Text('LTP ${Formatters.price(stock!.ltp)}',
                    style: AppTypography.caption),
              ],
            ),
    );
  }
}
