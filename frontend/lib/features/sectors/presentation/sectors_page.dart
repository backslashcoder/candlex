import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/formatting/formatters.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/models/stock.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/breadth_bar.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/percentage_change.dart';
import '../../../core/widgets/score_indicator.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/sector_heatmap.dart';
import '../../../core/widgets/states.dart';
import '../../stock_detail/presentation/stock_detail_entry.dart';
import 'cubit/sectors_cubit.dart';

class SectorsPage extends StatelessWidget {
  const SectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SectorsCubit(sl<MarketDataStore>())..load(),
      child: const _SectorsView(),
    );
  }
}

class _SectorsView extends StatelessWidget {
  const _SectorsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectorsCubit, SectorsState>(
      builder: (context, state) {
        final cubit = context.read<SectorsCubit>();
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        final selected = state.selectedSector;
        return PageScaffold(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Sector Intelligence',
                subtitle: 'Rotation, strength and constituents by sector',
                icon: Icons.grid_view_outlined,
                trailing: const MockDataBadge(),
              ),
              TerminalPanel(
                title: 'Sector Heatmap',
                headerIcon: Icons.dashboard_customize_outlined,
                child: SectorHeatmap(
                  sectors: state.sectors,
                  selected: selected?.name,
                  onTap: (s) => cubit.select(s.name),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (selected != null)
                _SectorDetail(
                  sectorName: selected.name,
                  constituents: state.constituents(selected.name),
                  rank: selected.rank,
                  avgChange: selected.avgChangePercent,
                  relativeStrength: selected.relativeStrength,
                  bullish: selected.bullishCount,
                  bearish: selected.bearishCount,
                ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }
}

class _SectorDetail extends StatelessWidget {
  const _SectorDetail({
    required this.sectorName,
    required this.constituents,
    required this.rank,
    required this.avgChange,
    required this.relativeStrength,
    required this.bullish,
    required this.bearish,
  });

  final String sectorName;
  final List<Stock> constituents;
  final int rank;
  final double avgChange;
  final double relativeStrength;
  final int bullish;
  final int bearish;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= AppSpacing.tabletBreakpoint;
    final stats = TerminalPanel(
      title: '$sectorName · Overview',
      headerIcon: Icons.insights,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _stat('Rank', '#$rank', AppColors.accent),
              _stat('Avg Change', Formatters.percent(avgChange),
                  AppColors.forChange(avgChange)),
              _stat('Rel. Strength', relativeStrength.toStringAsFixed(0),
                  AppColors.accent),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          BreadthBar(
              positive: bullish,
              negative: bearish,
              positiveLabel: 'Bullish',
              negativeLabel: 'Bearish'),
        ],
      ),
    );

    final table = TerminalPanel(
      padding: EdgeInsets.zero,
      title: 'Constituents (${constituents.length})',
      headerIcon: Icons.list,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: constituents.length,
        itemBuilder: (context, i) => _ConstituentRow(stock: constituents[i]),
      ),
    );

    if (!wide) {
      return Column(children: [stats, const SizedBox(height: AppSpacing.lg), table]);
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 320, child: stats),
          const SizedBox(width: AppSpacing.lg),
          Expanded(child: table),
        ],
      ),
    );
  }

  Widget _stat(String label, String value, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(), style: AppTypography.caption),
            const SizedBox(height: 2),
            Text(value, style: AppTypography.num.copyWith(color: color)),
          ],
        ),
      );
}

class _ConstituentRow extends StatelessWidget {
  const _ConstituentRow({required this.stock});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showStockDetail(context, stock.symbol),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 9),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Text(stock.symbol,
                    style: AppTypography.numSmall
                        .copyWith(fontWeight: FontWeight.w600))),
            Expanded(
                flex: 3,
                child: Text(Formatters.price(stock.ltp),
                    style: AppTypography.numSmall, textAlign: TextAlign.right)),
            Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: PercentageChange(stock.changePercent))),
            Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: StrengthIndicator(stock.strengthScore, width: 42))),
          ],
        ),
      ),
    );
  }
}
