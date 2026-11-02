import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/enums.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/sector_heatmap.dart';
import '../../../core/widgets/states.dart';
import '../domain/market_repository.dart';
import 'cubit/overview_cubit.dart';
import 'widgets/breadth_panel.dart';
import 'widgets/index_cards.dart';
import 'widgets/sentiment_panel.dart';
import 'widgets/shortlist_panel.dart';
import 'widgets/stock_board.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OverviewCubit(sl<MarketRepository>())..load(),
      child: const _OverviewView(),
    );
  }
}

class _OverviewView extends StatelessWidget {
  const _OverviewView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewCubit, OverviewState>(
      builder: (context, state) {
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        if (state.status.isError) {
          return ErrorStateView(
            message: state.error ?? 'Failed to load market overview.',
            onRetry: () => context.read<OverviewCubit>().load(),
          );
        }
        final overview = state.overview!;
        final width = MediaQuery.sizeOf(context).width;
        final wide = width >= AppSpacing.tabletBreakpoint;

        return PageScaffold(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Market Overview',
                subtitle: 'Live simulated snapshot of the Indian F&O universe',
                icon: Icons.dashboard_outlined,
                trailing: const MockDataBadge(),
              ),
              IndexCards(indices: overview.indices),
              const SizedBox(height: AppSpacing.lg),
              // Bullish / bearish boards — the central component.
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StockBoard(
                        title: 'Bullish Board',
                        direction: Direction.bullish,
                        stocks: state.bullish,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(
                      child: StockBoard(
                        title: 'Bearish Board',
                        direction: Direction.bearish,
                        stocks: state.bearish,
                      ),
                    ),
                  ],
                )
              else ...[
                StockBoard(
                  title: 'Bullish Board',
                  direction: Direction.bullish,
                  stocks: state.bullish,
                ),
                const SizedBox(height: AppSpacing.lg),
                StockBoard(
                  title: 'Bearish Board',
                  direction: Direction.bearish,
                  stocks: state.bearish,
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              // Sentiment · breadth · shortlist.
              _ThreeUp(
                wide: wide,
                children: [
                  SentimentPanel(overview: overview),
                  BreadthPanel(breadth: overview.breadth),
                  ShortlistPanel(bullish: state.bullish, bearish: state.bearish),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              TerminalPanel(
                title: 'Sector Performance',
                headerIcon: Icons.grid_view,
                child: SectorHeatmap(sectors: state.sectors),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }
}

/// Lays out three panels in a row on wide screens, stacked otherwise.
class _ThreeUp extends StatelessWidget {
  const _ThreeUp({required this.children, required this.wide});
  final List<Widget> children;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) const SizedBox(height: AppSpacing.lg),
          ],
        ],
      );
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < children.length; i++) ...[
            Expanded(child: children[i]),
            if (i < children.length - 1) const SizedBox(width: AppSpacing.lg),
          ],
        ],
      ),
    );
  }
}
