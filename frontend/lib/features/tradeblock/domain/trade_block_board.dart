import 'package:equatable/equatable.dart';

import '../../../core/enums.dart';
import 'oi_buildup.dart';
import 'trade_block_entry.dart';

/// A full snapshot of the TradeBlock flow: every instrument classified by
/// build-up, with convenience partitions the UI zones consume.
class TradeBlockBoard extends Equatable {
  const TradeBlockBoard({required this.entries});

  final List<TradeBlockEntry> entries;

  static const TradeBlockBoard empty = TradeBlockBoard(entries: []);

  List<TradeBlockEntry> get bullish =>
      entries.where((e) => e.direction == Direction.bullish).toList()
        ..sort((a, b) => b.strengthScore.compareTo(a.strengthScore));

  List<TradeBlockEntry> get bearish =>
      entries.where((e) => e.direction == Direction.bearish).toList()
        ..sort((a, b) => a.strengthScore.compareTo(b.strengthScore));

  List<TradeBlockEntry> forBuildup(OiBuildup b) =>
      entries.where((e) => e.buildup == b).toList()
        ..sort((a, b2) => b2.strengthScore.compareTo(a.strengthScore));

  int countFor(OiBuildup b) => entries.where((e) => e.buildup == b).length;

  /// Highest-conviction setups per side — the featured column.
  List<TradeBlockEntry> get featured {
    final bull = bullish.where((e) => e.buildup != OiBuildup.neutral).take(4);
    final bear = bearish.where((e) => e.buildup != OiBuildup.neutral).take(4);
    return [...bull, ...bear];
  }

  TradeBlockEntry? bySymbol(String symbol) {
    for (final e in entries) {
      if (e.symbol == symbol) return e;
    }
    return null;
  }

  @override
  List<Object?> get props => [entries];
}
