import 'package:flutter/material.dart';

import '../../../app/di/injector.dart';
import '../../../core/formatting/formatters.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/models/stock.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/percentage_change.dart';
import 'stock_detail_modal.dart';

/// Opens the large stock-detail / chart workspace for [symbol]. Single entry
/// point used by boards, scanner, watchlists and search.
Future<void> showStockDetail(BuildContext context, String symbol) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (_) => StockDetailModal(symbol: symbol),
  );
}

/// Global command-palette style stock search.
Future<void> showStockSearch(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => const _StockSearchDialog(),
  );
}

class _StockSearchDialog extends StatefulWidget {
  const _StockSearchDialog();

  @override
  State<_StockSearchDialog> createState() => _StockSearchDialogState();
}

class _StockSearchDialogState extends State<_StockSearchDialog> {
  final MarketDataStore _store = sl<MarketDataStore>();
  String _query = '';

  List<Stock> get _results {
    final all = _store.stocks;
    if (_query.isEmpty) {
      return (all..sort((a, b) => b.strengthScore.compareTo(a.strengthScore)))
          .take(8)
          .toList();
    }
    final q = _query.toLowerCase();
    return all
        .where((s) =>
            s.symbol.toLowerCase().contains(q) ||
            s.name.toLowerCase().contains(q))
        .take(12)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.only(top: 90),
      backgroundColor: AppColors.surfaceElevated,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        side: const BorderSide(color: AppColors.border),
      ),
      child: SizedBox(
        width: 520,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: TextField(
                autofocus: true,
                style: AppTypography.body,
                onChanged: (v) => setState(() => _query = v),
                decoration: const InputDecoration(
                  hintText: 'Search symbol or company…',
                  prefixIcon: Icon(Icons.search, size: 18),
                ),
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(AppSpacing.sm),
                itemCount: _results.length,
                itemBuilder: (context, i) {
                  final s = _results[i];
                  return ListTile(
                    dense: true,
                    hoverColor: AppColors.surfaceSecondary,
                    title: Row(
                      children: [
                        Text(s.symbol,
                            style: AppTypography.numSmall
                                .copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(s.name,
                              style: AppTypography.caption,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Formatters.price(s.ltp),
                            style: AppTypography.numSmall),
                        const SizedBox(width: 10),
                        PercentageChange(s.changePercent),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      showStockDetail(context, s.symbol);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
