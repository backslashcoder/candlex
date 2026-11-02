import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/inputs.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/stock_table.dart';
import '../../stock_detail/presentation/stock_detail_entry.dart';
import 'cubit/scanner_cubit.dart';
import '../domain/scanner_filter.dart';
import '../domain/scanner_repository.dart';
import 'widgets/filter_panel.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScannerCubit(sl<ScannerRepository>())..load(),
      child: const _ScannerView(),
    );
  }
}

class _ScannerView extends StatelessWidget {
  const _ScannerView();

  static const _columns = [
    StockColumn.symbol,
    StockColumn.ltp,
    StockColumn.changePercent,
    StockColumn.strength,
    StockColumn.liquidity,
    StockColumn.volumeRatio,
    StockColumn.sector,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerCubit, ScannerState>(
      builder: (context, state) {
        final cubit = context.read<ScannerCubit>();
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        if (state.status.isError) {
          return ErrorStateView(
              message: state.error ?? 'Failed to load.', onRetry: cubit.load);
        }
        final visible = state.visible;
        final sectors = (state.allStocks.map((s) => s.sector).toSet().toList()
          ..sort());
        final wide = MediaQuery.sizeOf(context).width >= AppSpacing.laptopBreakpoint;

        final filterPanel = FilterPanel(
          filter: state.filter,
          sectors: sectors,
          onChanged: cubit.setFilter,
          onReset: cubit.resetFilter,
        );

        final table = TerminalPanel(
          padding: EdgeInsets.zero,
          title: '${visible.length} results',
          headerIcon: Icons.list_alt,
          trailing: SearchField(
            width: 160,
            onChanged: (v) => cubit.setFilter(state.filter.copyWith(query: v)),
          ),
          child: visible.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: EmptyState(
                      title: 'No matches',
                      message: 'Adjust the filters or tab to widen the scan.'),
                )
              : StockRankingTable(
                  stocks: visible,
                  columns: _columns,
                  sortColumn: state.sortColumn,
                  sortAscending: state.sortAscending,
                  onSort: cubit.sort,
                  onSelect: (s) => showStockDetail(context, s.symbol),
                  maxBodyHeight: 560,
                ),
        );

        return PageScaffold(
          scrollable: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Stock Scanner',
                subtitle: 'Scan the F&O universe with presets and filters',
                icon: Icons.radar_outlined,
                trailing: const MockDataBadge(),
              ),
              _Tabs(active: state.tab, onTab: cubit.setTab),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 240, child: filterPanel),
                          const SizedBox(width: AppSpacing.lg),
                          Expanded(child: table),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            filterPanel,
                            const SizedBox(height: AppSpacing.lg),
                            table,
                          ],
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.active, required this.onTab});
  final ScannerTab active;
  final ValueChanged<ScannerTab> onTab;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final tab in ScannerTab.values) ...[
            AppFilterChip(
              label: tab.label,
              selected: tab == active,
              onTap: () => onTab(tab),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
