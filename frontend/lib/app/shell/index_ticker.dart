import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/formatting/formatters.dart';
import '../../core/mock/market_data_store.dart';
import '../../core/models/market_index.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../di/injector.dart';

/// Horizontal strip of live-updating market indices. Subscribes directly to
/// the store tick stream (cheap, few items) and cancels on dispose.
class IndexTicker extends StatefulWidget {
  const IndexTicker({super.key, this.spacing = 20});
  final double spacing;

  @override
  State<IndexTicker> createState() => _IndexTickerState();
}

class _IndexTickerState extends State<IndexTicker> {
  final MarketDataStore _store = sl<MarketDataStore>();
  late StreamSubscription<void> _sub;
  late List<MarketIndex> _indices;

  @override
  void initState() {
    super.initState();
    _indices = _store.indices;
    _sub = _store.ticks.listen((_) {
      if (mounted) setState(() => _indices = _store.indices);
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final idx in _indices) ...[
            _IndexChip(index: idx),
            SizedBox(width: widget.spacing),
          ],
        ],
      ),
    );
  }
}

class _IndexChip extends StatelessWidget {
  const _IndexChip({required this.index});
  final MarketIndex index;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forChange(index.change);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(index.symbol,
            style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
        const SizedBox(width: 6),
        Text(
          index.isVolatilityIndex
              ? index.value.toStringAsFixed(2)
              : Formatters.priceWhole(index.value),
          style: AppTypography.numSmall.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(width: 4),
        Text('(${Formatters.percent(index.changePercent)})',
            style: AppTypography.caption.copyWith(color: color)),
      ],
    );
  }
}
