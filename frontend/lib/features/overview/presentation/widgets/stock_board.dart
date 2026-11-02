import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/inputs.dart';
import '../../../../core/widgets/panel.dart';
import '../../../../core/widgets/stock_table.dart';
import '../../../stock_detail/presentation/stock_detail_entry.dart';

/// A ranked board of stocks for one direction. Supports symbol search, sector
/// filtering, column sorting and row selection. Reused for bullish & bearish.
class StockBoard extends StatefulWidget {
  const StockBoard({
    super.key,
    required this.title,
    required this.direction,
    required this.stocks,
    this.maxRows = 20,
  });

  final String title;
  final Direction direction;
  final List<Stock> stocks;
  final int maxRows;

  @override
  State<StockBoard> createState() => _StockBoardState();
}

class _StockBoardState extends State<StockBoard> {
  String _query = '';
  String? _sector;
  StockColumn _sortColumn = StockColumn.strength;
  bool _ascending = false;
  String? _selected;

  static const _columns = [
    StockColumn.rank,
    StockColumn.symbol,
    StockColumn.ltp,
    StockColumn.changePercent,
    StockColumn.strength,
    StockColumn.liquidity,
    StockColumn.volumeRatio,
    StockColumn.rankMovement,
  ];

  List<Stock> get _filtered {
    var list = widget.stocks.where((s) {
      final matchQuery = _query.isEmpty ||
          s.symbol.toLowerCase().contains(_query.toLowerCase()) ||
          s.name.toLowerCase().contains(_query.toLowerCase());
      final matchSector = _sector == null || s.sector == _sector;
      return matchQuery && matchSector;
    }).toList();

    list.sort((a, b) {
      final av = _sortColumn.sortValue(a);
      final bv = _sortColumn.sortValue(b);
      final cmp = av.compareTo(bv);
      return _ascending ? cmp : -cmp;
    });
    return list.take(widget.maxRows).toList();
  }

  List<String> get _sectors =>
      (widget.stocks.map((s) => s.sector).toSet().toList()..sort());

  Color get _accent =>
      widget.direction == Direction.bullish ? AppColors.bullish : AppColors.bearish;

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    return TerminalPanel(
      padding: EdgeInsets.zero,
      title: widget.title,
      headerIcon: widget.direction == Direction.bullish
          ? Icons.trending_up
          : Icons.trending_down,
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: _accent.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text('${widget.stocks.length}',
            style: AppTypography.caption
                .copyWith(color: _accent, fontWeight: FontWeight.w700)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Row(
              children: [
                SearchField(
                  width: 150,
                  onChanged: (v) => setState(() => _query = v),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: CompactDropdown<String?>(
                    value: _sector,
                    width: double.infinity,
                    items: [null, ..._sectors],
                    labelOf: (s) => s ?? 'All sectors',
                    onChanged: (v) => setState(() => _sector = v),
                  ),
                ),
              ],
            ),
          ),
          StockRankingTable(
            stocks: filtered,
            columns: _columns,
            sortColumn: _sortColumn,
            sortAscending: _ascending,
            selectedSymbol: _selected,
            onSort: (col) => setState(() {
              if (_sortColumn == col) {
                _ascending = !_ascending;
              } else {
                _sortColumn = col;
                _ascending = false;
              }
            }),
            onSelect: (s) {
              setState(() => _selected = s.symbol);
              showStockDetail(context, s.symbol);
            },
          ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text('No stocks match the filter.',
                  style: AppTypography.bodySmall, textAlign: TextAlign.center),
            ),
        ],
      ),
    );
  }
}
