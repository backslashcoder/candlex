import 'package:equatable/equatable.dart';

import '../../../core/enums.dart';
import '../../../core/models/stock.dart';
import '../../../core/utils/seeded_random.dart';
import 'oi_buildup.dart';

/// A single instrument projected onto the TradeBlock "flow": its live price
/// move, a derived (simulated) open-interest change, the resulting build-up
/// classification, and the demand/supply levels the setup card renders.
///
/// This is a computed view-model built from a live [Stock]; it is intentionally
/// not persisted, so it stays a plain immutable class rather than a Freezed
/// serializable model.
class TradeBlockEntry extends Equatable {
  const TradeBlockEntry({
    required this.symbol,
    required this.name,
    required this.sector,
    required this.ltp,
    required this.changePercent,
    required this.oiChangePct,
    required this.strengthScore,
    required this.liquidityScore,
    required this.vwap,
    required this.dayHigh,
    required this.dayLow,
    required this.buildup,
    required this.flowSeed,
  });

  final String symbol;
  final String name;
  final String sector;
  final double ltp;
  final double changePercent;
  final double oiChangePct;
  final double strengthScore;
  final double liquidityScore;
  final double vwap;
  final double dayHigh;
  final double dayLow;
  final OiBuildup buildup;

  /// Deterministic seed (0..1) used to shape this entry's stream path so the
  /// flow visualization is stable across ticks for a given symbol.
  final double flowSeed;

  /// Builds an entry from a live stock. [oiChangePct] is a deterministic,
  /// clearly-simulated value seeded by the symbol so it is stable across ticks.
  factory TradeBlockEntry.fromStock(Stock s) {
    final rng = SeededRandom(stableHash('oi-${s.symbol}'));
    final oi = double.parse(rng.range(-18, 24).toStringAsFixed(1));
    final seed = SeededRandom(stableHash('flow-${s.symbol}')).next();
    return TradeBlockEntry(
      symbol: s.symbol,
      name: s.name,
      sector: s.sector,
      ltp: s.ltp,
      changePercent: s.changePercent,
      oiChangePct: oi,
      strengthScore: s.strengthScore,
      liquidityScore: s.liquidityScore,
      vwap: s.vwap,
      dayHigh: s.dayHigh,
      dayLow: s.dayLow,
      buildup: OiBuildupX.classify(s.changePercent, oi),
      flowSeed: seed,
    );
  }

  Direction get direction => buildup.direction;

  // --- Derived demand/supply levels ----------------------------------------
  double get zoneLow => vwap * 0.9972;
  double get zoneHigh => vwap * 1.0028;
  double get entryMid => vwap;
  double get support => dayLow;
  double get resistance1 => dayHigh;
  double get resistance2 => dayHigh + (dayHigh - dayLow) * 0.6;

  /// Reward-to-risk measured from the zone midpoint, in the setup's direction.
  double get riskReward {
    if (buildup.isBearish) {
      final risk = (resistance1 - entryMid).abs();
      final reward = (entryMid - support).abs();
      return risk == 0 ? 0 : reward / risk;
    }
    final risk = (entryMid - support).abs();
    final reward = (resistance1 - entryMid).abs();
    return risk == 0 ? 0 : reward / risk;
  }

  @override
  List<Object?> get props => [
        symbol,
        ltp,
        changePercent,
        oiChangePct,
        strengthScore,
        buildup,
      ];
}
