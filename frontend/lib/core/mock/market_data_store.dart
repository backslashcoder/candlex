import 'dart:async';

import '../enums.dart';
import '../models/alert.dart';
import '../models/market_breadth.dart';
import '../models/market_index.dart';
import '../models/market_overview.dart';
import '../models/sector.dart';
import '../models/stock.dart';
import '../models/trading_signal.dart';
import '../utils/seeded_random.dart';
import 'seed_data.dart';

/// Single source of truth for all simulated market state. Deterministically
/// seeded, then nudged in small continuous steps by [MarketSimulator].
///
/// Designed to be replaced by a live WebSocket-backed store later: consumers
/// depend only on the getters and the [ticks] stream.
class MarketDataStore {
  MarketDataStore() {
    _initialize();
  }

  final Map<String, Stock> _stocks = {};
  final Map<String, MarketIndex> _indices = {};
  final Map<String, SeededRandom> _rng = {};
  List<TradingSignal> _signals = [];
  List<Alert> _alerts = [];
  MarketSession _session = MarketSession.open;

  final StreamController<void> _tickController =
      StreamController<void>.broadcast();

  /// Emits whenever simulated state changes. Cubits listen and re-read.
  Stream<void> get ticks => _tickController.stream;

  // --- Public read API ------------------------------------------------------
  List<Stock> get stocks => _stocks.values.toList();
  Stock? stock(String symbol) => _stocks[symbol];
  List<MarketIndex> get indices => _indices.values.toList();
  List<TradingSignal> get signals => List.unmodifiable(_signals);
  List<Alert> get alerts => List.unmodifiable(_alerts);
  MarketSession get session => _session;

  List<Stock> bullish() {
    final list = _stocks.values
        .where((s) => s.direction == Direction.bullish)
        .toList()
      ..sort((a, b) => b.strengthScore.compareTo(a.strengthScore));
    return list;
  }

  List<Stock> bearish() {
    final list = _stocks.values
        .where((s) => s.direction == Direction.bearish)
        .toList()
      ..sort((a, b) => a.strengthScore.compareTo(b.strengthScore));
    return list;
  }

  MarketBreadth breadth() {
    var adv = 0, dec = 0, unch = 0, newHi = 0, newLo = 0, aboveV = 0, belowV = 0;
    final dist = List<int>.filled(5, 0); // buckets of strength 0-20..80-100
    for (final s in _stocks.values) {
      switch (s.direction) {
        case Direction.bullish:
          adv++;
        case Direction.bearish:
          dec++;
        case Direction.neutral:
          unch++;
      }
      if (s.ltp >= s.dayHigh * 0.998) newHi++;
      if (s.ltp <= s.dayLow * 1.002) newLo++;
      if (s.ltp >= s.vwap) {
        aboveV++;
      } else {
        belowV++;
      }
      final bucket = (s.strengthScore / 20).floor().clamp(0, 4);
      dist[bucket]++;
    }
    return MarketBreadth(
      advances: adv,
      declines: dec,
      unchanged: unch,
      newHighs: newHi,
      newLows: newLo,
      aboveVwap: aboveV,
      belowVwap: belowV,
      strengthDistribution: dist,
    );
  }

  List<SectorPerformance> sectors() {
    final result = <SectorPerformance>[];
    for (final sector in kSectors) {
      final members =
          _stocks.values.where((s) => s.sector == sector).toList();
      if (members.isEmpty) continue;
      final avg = members.map((s) => s.changePercent).reduce((a, b) => a + b) /
          members.length;
      final bull = members.where((s) => s.direction == Direction.bullish).length;
      final bear = members.where((s) => s.direction == Direction.bearish).length;
      final rs = members.map((s) => s.strengthScore).reduce((a, b) => a + b) /
          members.length;
      final sortedBull = members.toList()
        ..sort((a, b) => b.changePercent.compareTo(a.changePercent));
      final sortedBear = members.toList()
        ..sort((a, b) => a.changePercent.compareTo(b.changePercent));
      result.add(SectorPerformance(
        name: sector,
        avgChangePercent: double.parse(avg.toStringAsFixed(2)),
        bullishCount: bull,
        bearishCount: bear,
        relativeStrength: double.parse(rs.toStringAsFixed(1)),
        rank: 0,
        topBullish: sortedBull.take(3).map((s) => s.symbol).toList(),
        topBearish: sortedBear.take(3).map((s) => s.symbol).toList(),
      ));
    }
    result.sort((a, b) => b.relativeStrength.compareTo(a.relativeStrength));
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].copyWith(rank: i + 1, previousRank: i + 1);
    }
    return result;
  }

  MarketOverview overview() {
    final secs = sectors();
    final adv = breadth().advances;
    final dec = breadth().declines;
    final sentiment = adv > dec * 1.15
        ? Direction.bullish
        : dec > adv * 1.15
            ? Direction.bearish
            : Direction.neutral;
    final participation = _stocks.isEmpty
        ? 0.0
        : _stocks.values.where((s) => s.volumeRatio > 1).length /
            _stocks.length *
            100;
    return MarketOverview(
      indices: indices,
      breadth: breadth(),
      sentiment: sentiment,
      participation: double.parse(participation.toStringAsFixed(1)),
      leadingSector: secs.first.name,
      weakestSector: secs.last.name,
      session: _session,
      asOf: DateTime.now(),
    );
  }

  // --- Initialization -------------------------------------------------------
  void _initialize() {
    _session = _deriveSession(DateTime.now());

    for (final seed in kStockSeeds) {
      final rng = SeededRandom(stableHash(seed.symbol));
      _rng[seed.symbol] = rng;

      // Deterministic initial move; slight bullish/bearish split by hash.
      final bias = rng.range(-3.2, 3.6);
      final changePct = double.parse(bias.toStringAsFixed(2));
      final prevClose = seed.basePrice;
      final ltp = double.parse(
          (prevClose * (1 + changePct / 100)).toStringAsFixed(2));
      final open =
          double.parse((prevClose * (1 + rng.noise(0.004))).toStringAsFixed(2));
      final hi = [ltp, open, prevClose].reduce((a, b) => a > b ? a : b);
      final lo = [ltp, open, prevClose].reduce((a, b) => a < b ? a : b);
      final dayHigh = double.parse((hi * (1 + rng.range(0.001, 0.012))).toStringAsFixed(2));
      final dayLow = double.parse((lo * (1 - rng.range(0.001, 0.012))).toStringAsFixed(2));
      final avgVol = rng.range(0.8, 4.0) * 1e6;
      final volRatio = rng.range(0.5, 2.4);
      final vwap = double.parse(
          (prevClose * (1 + rng.noise(0.006))).toStringAsFixed(2));

      final strength = _strengthFor(changePct, volRatio, rng);
      final liquidity = _liquidityFor(seed.marketCapCr, volRatio, rng);

      _stocks[seed.symbol] = Stock(
        symbol: seed.symbol,
        name: seed.name,
        sector: seed.sector,
        exchange: seed.exchange,
        ltp: ltp,
        previousClose: prevClose,
        dayHigh: dayHigh,
        dayLow: dayLow,
        open: open,
        volume: avgVol * volRatio,
        avgVolume: avgVol,
        marketCap: seed.marketCapRupees,
        strengthScore: strength,
        liquidityScore: liquidity,
        vwap: vwap,
        orderBlockStatus: rng.chance(0.55)
            ? OrderBlockStatus.active
            : rng.chance(0.5)
                ? OrderBlockStatus.mitigated
                : OrderBlockStatus.none,
      );
    }
    _recomputeRanks();

    for (final seed in kIndexSeeds) {
      final rng = SeededRandom(stableHash('idx-${seed.symbol}'));
      _rng['idx-${seed.symbol}'] = rng;
      final chg = seed.isVix ? rng.range(-6, 8) : rng.range(-1.1, 1.3);
      final prev = seed.base;
      _indices[seed.symbol] = MarketIndex(
        symbol: seed.symbol,
        name: seed.name,
        previousClose: prev,
        value: double.parse((prev * (1 + chg / 100)).toStringAsFixed(2)),
        isVolatilityIndex: seed.isVix,
      );
    }
  }

  double _strengthFor(double changePct, double volRatio, SeededRandom rng) {
    final base = 50 + changePct * 7 + (volRatio - 1) * 6 + rng.noise(6);
    return double.parse(base.clamp(2, 99).toStringAsFixed(1));
  }

  double _liquidityFor(double marketCapCr, double volRatio, SeededRandom rng) {
    final capScore = (marketCapCr / 2000000 * 60).clamp(10, 60);
    final v = capScore + volRatio * 14 + rng.noise(5);
    return double.parse(v.clamp(5, 99).toStringAsFixed(1));
  }

  void _recomputeRanks() {
    final bull = _stocks.values
        .where((s) => s.direction == Direction.bullish)
        .toList()
      ..sort((a, b) => b.strengthScore.compareTo(a.strengthScore));
    final bear = _stocks.values
        .where((s) => s.direction == Direction.bearish)
        .toList()
      ..sort((a, b) => a.strengthScore.compareTo(b.strengthScore));
    for (int i = 0; i < bull.length; i++) {
      final s = bull[i];
      _stocks[s.symbol] = s.copyWith(
        previousRank: s.rank == 0 ? i + 1 : s.rank,
        rank: i + 1,
      );
    }
    for (int i = 0; i < bear.length; i++) {
      final s = bear[i];
      _stocks[s.symbol] = s.copyWith(
        previousRank: s.rank == 0 ? i + 1 : s.rank,
        rank: i + 1,
      );
    }
  }

  MarketSession _deriveSession(DateTime now) {
    if (now.weekday == DateTime.saturday || now.weekday == DateTime.sunday) {
      return MarketSession.weekendHoliday;
    }
    final minutes = now.hour * 60 + now.minute;
    if (minutes >= 9 * 60 && minutes < 9 * 60 + 15) return MarketSession.preMarket;
    if (minutes >= 9 * 60 + 15 && minutes <= 15 * 60 + 30) {
      return MarketSession.open;
    }
    return MarketSession.closed;
  }

  // --- Simulation step (called by MarketSimulator) --------------------------
  void applyTick() {
    for (final entry in _stocks.entries.toList()) {
      final s = entry.value;
      final rng = _rng[s.symbol]!;
      // Continuous small move; cap per-tick drift for realism.
      final deltaPct = rng.noise(0.18);
      final newLtp = double.parse(
          (s.ltp * (1 + deltaPct / 100)).clamp(s.previousClose * 0.5, s.previousClose * 1.5)
              .toStringAsFixed(2));
      final newChangePct =
          (newLtp - s.previousClose) / s.previousClose * 100;
      final newVol = (s.volume + rng.range(0, 1) * s.avgVolume * 0.01);
      final newStrength = double.parse(
          (s.strengthScore + rng.noise(0.6) + newChangePct * 0.02)
              .clamp(2, 99)
              .toStringAsFixed(1));
      _stocks[s.symbol] = s.copyWith(
        ltp: newLtp,
        volume: newVol,
        strengthScore: newStrength,
        dayHigh: newLtp > s.dayHigh ? newLtp : s.dayHigh,
        dayLow: newLtp < s.dayLow ? newLtp : s.dayLow,
      );
    }
    _recomputeRanks();

    for (final entry in _indices.entries.toList()) {
      final idx = entry.value;
      final rng = _rng['idx-${idx.symbol}']!;
      final deltaPct = rng.noise(idx.isVolatilityIndex ? 0.6 : 0.05);
      _indices[idx.symbol] = idx.copyWith(
        value: double.parse(
            (idx.value * (1 + deltaPct / 100)).toStringAsFixed(2)),
      );
    }

    _evolveSignals();
    _session = _deriveSession(DateTime.now());
    _tickController.add(null);
  }

  void _evolveSignals() {
    if (_signals.isEmpty) return;
    final rng = SeededRandom(DateTime.now().millisecondsSinceEpoch & 0xFFFFFF);
    final updated = <TradingSignal>[];
    for (final sig in _signals) {
      var next = sig;
      final live = _stocks[sig.symbol];
      if (live != null) next = next.copyWith(currentPrice: live.ltp);
      // Occasionally advance lifecycle of active signals.
      if (sig.isActive && rng.chance(0.015)) {
        if (sig.status == SignalStatus.active) {
          next = next.copyWith(status: SignalStatus.triggered);
        } else if (sig.status == SignalStatus.triggered) {
          next = next.copyWith(
            status: rng.chance(0.6)
                ? SignalStatus.targetReached
                : SignalStatus.invalidated,
          );
        }
      }
      updated.add(next);
    }
    _signals = updated;
  }

  // --- Mutations for repos --------------------------------------------------
  void setSignals(List<TradingSignal> signals) => _signals = signals;
  void setAlerts(List<Alert> alerts) => _alerts = alerts;
  void addAlert(Alert alert) => _alerts = [alert, ..._alerts];

  void dispose() {
    _tickController.close();
  }
}
