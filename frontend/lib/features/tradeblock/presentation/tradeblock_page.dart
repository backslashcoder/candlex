import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/inputs.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../../stock_detail/presentation/stock_detail_entry.dart';
import '../domain/oi_buildup.dart';
import '../domain/trade_block_repository.dart';
import 'cubit/trade_block_cubit.dart';
import 'widgets/buildup_grid.dart';
import 'widgets/buildup_style.dart';
import 'widgets/featured_setups.dart';
import 'widgets/flow_stream_panel.dart';

class TradeBlockPage extends StatelessWidget {
  const TradeBlockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TradeBlockCubit(sl<TradeBlockRepository>())..load(),
      child: const _TradeBlockView(),
    );
  }
}

class _TradeBlockView extends StatelessWidget {
  const _TradeBlockView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TradeBlockCubit, TradeBlockState>(
      builder: (context, state) {
        final cubit = context.read<TradeBlockCubit>();
        if (state.status.isInitial || state.status.isLoading) {
          return const LoadingState();
        }
        if (state.status.isError) {
          return ErrorStateView(
              message: state.error ?? 'Failed to load.', onRetry: cubit.load);
        }
        return Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'TradeBlock · Market Flow',
                subtitle:
                    'Live price direction × simulated open interest, mapped to F&O build-ups',
                icon: Icons.account_tree_outlined,
                trailing: const MockDataBadge(),
              ),
              const SizedBox(height: AppSpacing.sm),
              _FilterStrip(state: state, cubit: cubit),
              const SizedBox(height: AppSpacing.xs),
              const _Disclaimer(),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: LayoutBuilder(builder: (context, c) {
                  final wide = c.maxWidth >= 1080;
                  if (wide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: FlowStreamPanel(
                            board: state.board,
                            selectedSymbol: state.selectedSymbol,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          flex: 3,
                          child: BuildupGrid(
                            board: state.board,
                            selectedSymbol: state.selectedSymbol,
                            categoryFilter: state.categoryFilter,
                            onSelect: cubit.select,
                            onCategory: cubit.setCategory,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          flex: 4,
                          child: FeaturedSetups(
                            entries: state.featured,
                            selectedSymbol: state.selectedSymbol,
                            onSelect: cubit.select,
                            onOpen: (s) => showStockDetail(context, s),
                          ),
                        ),
                      ],
                    );
                  }
                  // Stacked layout for narrower viewports.
                  return ListView(
                    children: [
                      SizedBox(
                        height: 220,
                        child: FlowStreamPanel(
                          board: state.board,
                          selectedSymbol: state.selectedSymbol,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 340,
                        child: BuildupGrid(
                          board: state.board,
                          selectedSymbol: state.selectedSymbol,
                          categoryFilter: state.categoryFilter,
                          onSelect: cubit.select,
                          onCategory: cubit.setCategory,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        height: 560,
                        child: FeaturedSetups(
                          entries: state.featured,
                          selectedSymbol: state.selectedSymbol,
                          onSelect: cubit.select,
                          onOpen: (s) => showStockDetail(context, s),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterStrip extends StatelessWidget {
  const _FilterStrip({required this.state, required this.cubit});
  final TradeBlockState state;
  final TradeBlockCubit cubit;

  @override
  Widget build(BuildContext context) {
    const cats = [
      OiBuildup.longBuildup,
      OiBuildup.shortCovering,
      OiBuildup.shortBuildup,
      OiBuildup.longUnwinding,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppFilterChip(
            label: 'All build-ups',
            count: state.board.entries.length,
            selected: state.categoryFilter == null,
            onTap: () => cubit.setCategory(null),
          ),
          const SizedBox(width: AppSpacing.sm),
          for (final c in cats) ...[
            _BuildupChip(
              category: c,
              count: state.board.countFor(c),
              selected: state.categoryFilter == c,
              onTap: () => cubit.setCategory(c),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}

class _BuildupChip extends StatelessWidget {
  const _BuildupChip({
    required this.category,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final OiBuildup category;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = BuildupStyle.color(category);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? BuildupStyle.background(category) : AppColors.panel,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(color: selected ? color : AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(BuildupStyle.icon(category), size: 13, color: color),
            const SizedBox(width: 6),
            Text(category.label,
                style: AppTypography.bodySmall.copyWith(
                    color: selected ? color : AppColors.textSecondary,
                    fontWeight: FontWeight.w600)),
            const SizedBox(width: 6),
            Text('$count',
                style: AppTypography.caption
                    .copyWith(color: AppColors.textTertiary)),
          ],
        ),
      ),
    );
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline, size: 12, color: AppColors.textTertiary),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            'Open interest is simulated for illustration. Build-up labels and '
            'levels are analytical examples — not financial advice or trade recommendations.',
            style: AppTypography.caption,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
