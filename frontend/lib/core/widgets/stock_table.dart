import 'package:flutter/material.dart';

import '../formatting/formatters.dart';
import '../models/stock.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'percentage_change.dart';
import 'score_indicator.dart';

/// The columns a [StockRankingTable] can render. Used by both the overview
/// boards and the scanner to avoid duplicating table layout.
enum StockColumn {
  rank,
  symbol,
  ltp,
  changePercent,
  strength,
  liquidity,
  volumeRatio,
  sector,
  rankMovement,
}

extension StockColumnMeta on StockColumn {
  String get label => switch (this) {
        StockColumn.rank => '#',
        StockColumn.symbol => 'Symbol',
        StockColumn.ltp => 'LTP',
        StockColumn.changePercent => 'Chg %',
        StockColumn.strength => 'Strength',
        StockColumn.liquidity => 'Liquidity',
        StockColumn.volumeRatio => 'Vol',
        StockColumn.sector => 'Sector',
        StockColumn.rankMovement => 'Δ',
      };

  int get flex => switch (this) {
        StockColumn.rank => 2,
        StockColumn.symbol => 5,
        StockColumn.ltp => 4,
        StockColumn.changePercent => 4,
        StockColumn.strength => 5,
        StockColumn.liquidity => 5,
        StockColumn.volumeRatio => 3,
        StockColumn.sector => 5,
        StockColumn.rankMovement => 2,
      };

  bool get numeric => this != StockColumn.symbol && this != StockColumn.sector;
  bool get sortable => this != StockColumn.rankMovement;

  double sortValue(Stock s) => switch (this) {
        StockColumn.rank => s.rank.toDouble(),
        StockColumn.symbol => 0,
        StockColumn.ltp => s.ltp,
        StockColumn.changePercent => s.changePercent,
        StockColumn.strength => s.strengthScore,
        StockColumn.liquidity => s.liquidityScore,
        StockColumn.volumeRatio => s.volumeRatio,
        StockColumn.sector => 0,
        StockColumn.rankMovement => s.rankMovement.toDouble(),
      };
}

class StockRankingTable extends StatelessWidget {
  const StockRankingTable({
    super.key,
    required this.stocks,
    required this.columns,
    required this.onSelect,
    this.sortColumn,
    this.sortAscending = false,
    this.onSort,
    this.selectedSymbol,
    this.dense = true,
    this.maxBodyHeight,
  });

  final List<Stock> stocks;
  final List<StockColumn> columns;
  final ValueChanged<Stock> onSelect;
  final StockColumn? sortColumn;
  final bool sortAscending;
  final ValueChanged<StockColumn>? onSort;
  final String? selectedSymbol;
  final bool dense;
  final double? maxBodyHeight;

  @override
  Widget build(BuildContext context) {
    final rowHeight = dense ? 34.0 : 40.0;
    final body = ListView.builder(
      shrinkWrap: maxBodyHeight == null,
      physics: maxBodyHeight == null
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics(),
      itemCount: stocks.length,
      itemExtent: rowHeight,
      itemBuilder: (context, i) {
        final s = stocks[i];
        return _StockRow(
          stock: s,
          columns: columns,
          selected: s.symbol == selectedSymbol,
          striped: i.isOdd,
          onTap: () => onSelect(s),
        );
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _HeaderRow(
          columns: columns,
          sortColumn: sortColumn,
          sortAscending: sortAscending,
          onSort: onSort,
        ),
        if (maxBodyHeight != null)
          SizedBox(height: maxBodyHeight, child: body)
        else
          body,
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({
    required this.columns,
    required this.sortColumn,
    required this.sortAscending,
    required this.onSort,
  });

  final List<StockColumn> columns;
  final StockColumn? sortColumn;
  final bool sortAscending;
  final ValueChanged<StockColumn>? onSort;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        color: AppColors.surfaceSecondary,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        children: [
          for (final col in columns)
            Expanded(
              flex: col.flex,
              child: _HeaderCell(
                column: col,
                active: sortColumn == col,
                ascending: sortAscending,
                onSort: col.sortable && onSort != null
                    ? () => onSort!(col)
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({
    required this.column,
    required this.active,
    required this.ascending,
    required this.onSort,
  });

  final StockColumn column;
  final bool active;
  final bool ascending;
  final VoidCallback? onSort;

  @override
  Widget build(BuildContext context) {
    final align = column.numeric ? MainAxisAlignment.end : MainAxisAlignment.start;
    final content = Row(
      mainAxisAlignment: align,
      children: [
        Flexible(
          child: Text(
            column.label,
            style: AppTypography.caption.copyWith(
              color: active ? AppColors.accent : AppColors.textSecondary,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (active)
          Icon(ascending ? Icons.arrow_upward : Icons.arrow_downward,
              size: 11, color: AppColors.accent),
      ],
    );
    if (onSort == null) return content;
    return InkWell(
      onTap: onSort,
      child: MouseRegion(cursor: SystemMouseCursors.click, child: content),
    );
  }
}

class _StockRow extends StatefulWidget {
  const _StockRow({
    required this.stock,
    required this.columns,
    required this.selected,
    required this.striped,
    required this.onTap,
  });

  final Stock stock;
  final List<StockColumn> columns;
  final bool selected;
  final bool striped;
  final VoidCallback onTap;

  @override
  State<_StockRow> createState() => _StockRowState();
}

class _StockRowState extends State<_StockRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.selected
        ? AppColors.accent.withValues(alpha: 0.12)
        : _hover
            ? AppColors.surfaceSecondary
            : widget.striped
                ? AppColors.background.withValues(alpha: 0.25)
                : Colors.transparent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            border: const Border(
                bottom: BorderSide(color: AppColors.borderSubtle)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Row(
            children: [
              for (final col in widget.columns)
                Expanded(flex: col.flex, child: _cell(col)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cell(StockColumn col) {
    final s = widget.stock;
    final Widget content = switch (col) {
      StockColumn.rank => Text('${s.rank}',
          style: AppTypography.numSmall.copyWith(color: AppColors.textSecondary)),
      StockColumn.symbol => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(s.symbol,
                style: AppTypography.numSmall
                    .copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      StockColumn.ltp => Text(Formatters.price(s.ltp),
          style: AppTypography.numSmall, textAlign: TextAlign.right),
      StockColumn.changePercent =>
        Align(alignment: Alignment.centerRight, child: PercentageChange(s.changePercent)),
      StockColumn.strength => Align(
          alignment: Alignment.centerRight,
          child: StrengthIndicator(s.strengthScore, width: 42)),
      StockColumn.liquidity => Align(
          alignment: Alignment.centerRight,
          child: LiquidityIndicator(s.liquidityScore, width: 42)),
      StockColumn.volumeRatio => Text(Formatters.ratio(s.volumeRatio, decimals: 1),
          style: AppTypography.numSmall.copyWith(
            color: s.volumeRatio > 1.5
                ? AppColors.warning
                : AppColors.textPrimary,
          ),
          textAlign: TextAlign.right),
      StockColumn.sector => Text(s.sector,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
          overflow: TextOverflow.ellipsis),
      StockColumn.rankMovement =>
        Align(alignment: Alignment.centerRight, child: RankMovementIndicator(s.rankMovement)),
    };
    return content;
  }
}
