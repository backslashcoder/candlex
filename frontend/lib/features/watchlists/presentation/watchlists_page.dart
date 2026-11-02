import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector.dart';
import '../../../core/cubit/view_status.dart';
import '../../../core/formatting/formatters.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/models/stock.dart';
import '../../../core/models/watchlist.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/badges.dart';
import '../../../core/widgets/page_scaffold.dart';
import '../../../core/widgets/panel.dart';
import '../../../core/widgets/percentage_change.dart';
import '../../../core/widgets/score_indicator.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/states.dart';
import '../../stock_detail/presentation/stock_detail_entry.dart';
import '../domain/watchlist_repository.dart';
import 'cubit/watchlist_cubit.dart';

class WatchlistsPage extends StatelessWidget {
  const WatchlistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          WatchlistCubit(sl<WatchlistRepository>(), sl<MarketDataStore>())..load(),
      child: const _WatchlistsView(),
    );
  }
}

class _WatchlistsView extends StatelessWidget {
  const _WatchlistsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        final cubit = context.read<WatchlistCubit>();
        if (state.status.isLoading || state.status.isInitial) {
          return const LoadingState();
        }
        final wide = MediaQuery.sizeOf(context).width >= AppSpacing.tabletBreakpoint;
        final sidebar = _ListSidebar(state: state, cubit: cubit);
        final detail = _WatchlistDetail(state: state, cubit: cubit);

        return PageScaffold(
          scrollable: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: 'Watchlists',
                subtitle: 'Track your shortlisted stocks · saved locally',
                icon: Icons.star_outline,
                trailing: FilledButton.icon(
                  style: FilledButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      padding: const EdgeInsets.symmetric(horizontal: 12)),
                  onPressed: () => _promptName(context, cubit),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('New List'),
                ),
              ),
              Expanded(
                child: wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(width: 240, child: sidebar),
                          const SizedBox(width: AppSpacing.lg),
                          Expanded(child: detail),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: 160, child: sidebar),
                          const SizedBox(height: AppSpacing.lg),
                          Expanded(child: detail),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _promptName(BuildContext context, WatchlistCubit cubit,
      {String? existingId, String? initial}) {
    final controller = TextEditingController(text: initial);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.panel,
        title: Text(existingId == null ? 'New Watchlist' : 'Rename Watchlist',
            style: AppTypography.h2),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Watchlist name'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.accent),
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                if (existingId == null) {
                  cubit.createWatchlist(name);
                } else {
                  cubit.renameWatchlist(existingId, name);
                }
              }
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _ListSidebar extends StatelessWidget {
  const _ListSidebar({required this.state, required this.cubit});
  final WatchlistState state;
  final WatchlistCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TerminalPanel(
      padding: const EdgeInsets.all(AppSpacing.sm),
      title: 'Lists',
      headerIcon: Icons.folder_outlined,
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final w in state.watchlists)
            _ListTile(
              watchlist: w,
              selected: w.id == state.selected?.id,
              onTap: () => cubit.select(w.id),
            ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile(
      {required this.watchlist, required this.selected, required this.onTap});
  final Watchlist watchlist;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.12)
              : AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          border: Border.all(
              color: selected ? AppColors.accent.withValues(alpha: 0.4) : AppColors.borderSubtle),
        ),
        child: Row(
          children: [
            Icon(Icons.star,
                size: 13,
                color: selected ? AppColors.accent : AppColors.textTertiary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(watchlist.name,
                  style: AppTypography.bodySmall.copyWith(
                    color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis),
            ),
            Text('${watchlist.symbols.length}', style: AppTypography.caption),
          ],
        ),
      ),
    );
  }
}

class _WatchlistDetail extends StatelessWidget {
  const _WatchlistDetail({required this.state, required this.cubit});
  final WatchlistState state;
  final WatchlistCubit cubit;

  @override
  Widget build(BuildContext context) {
    final wl = state.selected;
    final store = sl<MarketDataStore>();
    if (wl == null) {
      return const TerminalPanel(
        child: EmptyState(
            title: 'No watchlist', message: 'Create a list to get started.'),
      );
    }
    final stocks =
        wl.symbols.map((s) => store.stock(s)).whereType<Stock>().toList();

    return TerminalPanel(
      padding: EdgeInsets.zero,
      title: wl.name,
      headerIcon: Icons.star,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Add stock',
            onPressed: () => _addStock(context),
            icon: const Icon(Icons.add, size: 16),
          ),
          IconButton(
            tooltip: 'Rename',
            onPressed: () {
              final controller = TextEditingController(text: wl.name);
              showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: AppColors.panel,
                  title: Text('Rename', style: AppTypography.h2),
                  content: TextField(controller: controller, autofocus: true),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Cancel')),
                    FilledButton(
                      style:
                          FilledButton.styleFrom(backgroundColor: AppColors.accent),
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          cubit.renameWatchlist(wl.id, controller.text.trim());
                        }
                        Navigator.pop(ctx);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined, size: 15),
          ),
          IconButton(
            tooltip: 'Delete list',
            onPressed: () => cubit.deleteWatchlist(wl.id),
            icon: const Icon(Icons.delete_outline, size: 15),
          ),
        ],
      ),
      child: stocks.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(AppSpacing.xxl),
              child: EmptyState(
                  icon: Icons.add_chart,
                  title: 'Empty watchlist',
                  message: 'Add stocks with the + button.'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: stocks.length,
              itemBuilder: (context, i) => _StockRow(
                stock: stocks[i],
                onOpen: () => showStockDetail(context, stocks[i].symbol),
                onRemove: () => cubit.removeSymbol(wl.id, stocks[i].symbol),
              ),
            ),
    );
  }

  void _addStock(BuildContext context) {
    final wl = state.selected!;
    final store = sl<MarketDataStore>();
    showDialog<void>(
      context: context,
      builder: (ctx) {
        String query = '';
        return StatefulBuilder(builder: (ctx, setLocal) {
          final results = store.stocks
              .where((s) =>
                  !wl.symbols.contains(s.symbol) &&
                  (query.isEmpty ||
                      s.symbol.toLowerCase().contains(query.toLowerCase()) ||
                      s.name.toLowerCase().contains(query.toLowerCase())))
              .take(20)
              .toList();
          return Dialog(
            backgroundColor: AppColors.panel,
            child: SizedBox(
              width: 440,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: TextField(
                      autofocus: true,
                      onChanged: (v) => setLocal(() => query = v),
                      decoration: const InputDecoration(
                          hintText: 'Add stock…',
                          prefixIcon: Icon(Icons.search, size: 16)),
                    ),
                  ),
                  const Divider(height: 1),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (final s in results)
                          ListTile(
                            dense: true,
                            title: Text(s.symbol, style: AppTypography.numSmall),
                            subtitle: Text(s.name, style: AppTypography.caption),
                            trailing: PercentageChange(s.changePercent),
                            onTap: () {
                              cubit.addSymbol(wl.id, s.symbol);
                              setLocal(() {});
                            },
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Done')),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class _StockRow extends StatelessWidget {
  const _StockRow(
      {required this.stock, required this.onOpen, required this.onRemove});
  final Stock stock;
  final VoidCallback onOpen;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stock.symbol,
                      style: AppTypography.numSmall
                          .copyWith(fontWeight: FontWeight.w600)),
                  Text(stock.sector, style: AppTypography.caption),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(Formatters.price(stock.ltp),
                  style: AppTypography.numSmall, textAlign: TextAlign.right),
            ),
            Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: PercentageChange(stock.changePercent)),
            ),
            Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: StrengthIndicator(stock.strengthScore, width: 40)),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: TagChip(stock.orderBlockStatus.name == 'active'
                    ? 'OB'
                    : stock.isNearVwap
                        ? 'VWAP'
                        : '—'),
              ),
            ),
            IconButton(
              tooltip: 'Remove',
              onPressed: onRemove,
              icon: const Icon(Icons.close, size: 14),
              splashRadius: 14,
            ),
          ],
        ),
      ),
    );
  }
}
