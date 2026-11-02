import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/inputs.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../domain/strategy_repository.dart';
import 'cubit/signals_cubit.dart';
import 'widgets/signal_card.dart';
import 'widgets/signal_detail.dart';

class SignalsPage extends StatelessWidget {
  const SignalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignalsCubit(sl<StrategyRepository>())..load(),
      child: const _SignalsView(),
    );
  }
}

class _SignalsView extends StatelessWidget {
  const _SignalsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignalsCubit, SignalsState>(
      builder: (context, state) {
        final cubit = context.read<SignalsCubit>();
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        if (state.status.isError) {
          return ErrorStateView(
              message: state.error ?? 'Failed to load.', onRetry: cubit.load);
        }
        final visible = state.visible;
        return PageScaffold(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Strategy Signals',
                subtitle: 'Simulated setups from the mock strategy engine',
                icon: Icons.insights_outlined,
                trailing: const MockDataBadge(),
              ),
              _StrategyStrip(state: state, cubit: cubit),
              const SizedBox(height: AppSpacing.lg),
              _StatusFilters(state: state, cubit: cubit),
              const SizedBox(height: AppSpacing.md),
              if (visible.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xxl),
                  child: EmptyState(
                      icon: Icons.filter_alt_off_outlined,
                      title: 'No signals match'),
                )
              else
                LayoutBuilder(builder: (context, constraints) {
                  final perRow = (constraints.maxWidth / 340).floor().clamp(1, 4);
                  const spacing = AppSpacing.md;
                  final cardWidth =
                      (constraints.maxWidth - spacing * (perRow - 1)) / perRow;
                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      for (final sig in visible)
                        SizedBox(
                          width: cardWidth,
                          child: TradingSignalCard(
                            signal: sig,
                            onTap: () => showSignalDetail(context, sig),
                          ),
                        ),
                    ],
                  );
                }),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }
}

class _StrategyStrip extends StatelessWidget {
  const _StrategyStrip({required this.state, required this.cubit});
  final SignalsState state;
  final SignalsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final perRow = (constraints.maxWidth / 240).floor().clamp(1, 5);
      const spacing = AppSpacing.md;
      final cardWidth = (constraints.maxWidth - spacing * (perRow - 1)) / perRow;
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          for (final strat in state.strategies)
            SizedBox(
              width: cardWidth,
              child: _StrategyCard(
                name: strat.type.shortLabel,
                description: strat.description,
                active: strat.activeCount,
                selected: state.strategyFilter == strat.type,
                onTap: () => cubit.setStrategyFilter(
                    state.strategyFilter == strat.type ? null : strat.type),
              ),
            ),
        ],
      );
    });
  }
}

class _StrategyCard extends StatelessWidget {
  const _StrategyCard({
    required this.name,
    required this.description,
    required this.active,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String description;
  final int active;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.panel,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
              color: selected ? AppColors.accent : AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(name,
                      style: AppTypography.numSmall
                          .copyWith(fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.accentBackground,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text('$active active',
                      style: AppTypography.caption
                          .copyWith(color: AppColors.accent)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(description,
                style: AppTypography.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class _StatusFilters extends StatelessWidget {
  const _StatusFilters({required this.state, required this.cubit});
  final SignalsState state;
  final SignalsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppFilterChip(
            label: 'All',
            count: state.signals.length,
            selected: state.statusFilter == null,
            onTap: () => cubit.setStatusFilter(null),
          ),
          const SizedBox(width: AppSpacing.sm),
          for (final status in SignalStatus.values) ...[
            AppFilterChip(
              label: status.label,
              count: state.countFor(status),
              selected: state.statusFilter == status,
              onTap: () => cubit.setStatusFilter(status),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
