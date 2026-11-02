import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/inputs.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../../overview/presentation/widgets/breadth_panel.dart';
import 'cubit/market_breadth_cubit.dart';
import 'widgets/breadth_scatter.dart';

class MarketBreadthPage extends StatelessWidget {
  const MarketBreadthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MarketBreadthCubit(sl<MarketDataStore>())..load(),
      child: const _BreadthView(),
    );
  }
}

class _BreadthView extends StatelessWidget {
  const _BreadthView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBreadthCubit, MarketBreadthState>(
      builder: (context, state) {
        final cubit = context.read<MarketBreadthCubit>();
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        final wide = MediaQuery.sizeOf(context).width >= AppSpacing.tabletBreakpoint;
        return PageScaffold(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Market Breadth',
                subtitle: 'Participation, distribution and the strength map',
                icon: Icons.bubble_chart_outlined,
                trailing: const MockDataBadge(),
              ),
              if (wide)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: TerminalPanel(
                          title: 'Strength Map',
                          headerIcon: Icons.scatter_plot,
                          trailing: CompactDropdown<String?>(
                            value: state.sectorFilter,
                            width: 150,
                            items: [null, ...state.sectors],
                            labelOf: (s) => s ?? 'All sectors',
                            onChanged: cubit.setSectorFilter,
                          ),
                          child: BreadthScatter(stocks: state.filtered),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      SizedBox(
                        width: 320,
                        child: BreadthPanel(breadth: state.breadth!),
                      ),
                    ],
                  ),
                )
              else ...[
                TerminalPanel(
                  title: 'Strength Map',
                  headerIcon: Icons.scatter_plot,
                  child: BreadthScatter(stocks: state.filtered),
                ),
                const SizedBox(height: AppSpacing.lg),
                BreadthPanel(breadth: state.breadth!),
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }
}
