import '../enums.dart';
import '../models/candle.dart';
import '../models/liquidity_level.dart';
import '../models/order_block.dart';
import '../models/stock.dart';
import '../models/technical_analysis.dart';
import '../utils/seeded_random.dart';

/// Derives a consistent [TechnicalAnalysis] (and the overlays the chart draws)
/// from a stock snapshot and its candle series.
class TechnicalBuilder {
  const TechnicalBuilder();

  TechnicalAnalysis build(Stock stock, List<Candle> candles) {
    final rng = SeededRandom(stableHash('ta-${stock.symbol}'));
    final isBull = stock.direction == Direction.bullish;

    final highs = candles.map((c) => c.high).toList();
    final lows = candles.map((c) => c.low).toList();
    final maxHigh = highs.reduce((a, b) => a > b ? a : b);
    final minLow = lows.reduce((a, b) => a < b ? a : b);

    final trend = _trend(stock.changePercent, stock.strengthScore);
    final momentum = _momentum(stock.strengthScore, stock.volumeRatio);
    final vwapPos = stock.ltp > stock.vwap * 1.001
        ? VwapPosition.above
        : stock.ltp < stock.vwap * 0.999
            ? VwapPosition.below
            : VwapPosition.at;
    final volStatus = stock.volumeRatio > 1.8
        ? VolumeStatus.surge
        : stock.volumeRatio > 1.2
            ? VolumeStatus.high
            : stock.volumeRatio > 0.7
                ? VolumeStatus.normal
                : VolumeStatus.low;

    // Order blocks around recent consolidation zones.
    final orderBlocks = <OrderBlock>[];
    final span = maxHigh - minLow;
    if (span > 0) {
      final bullTop = minLow + span * rng.range(0.22, 0.32);
      orderBlocks.add(OrderBlock(
        kind: OrderBlockKind.bullish,
        top: _r(bullTop),
        bottom: _r(bullTop - span * 0.05),
        from: candles[(candles.length * 0.3).floor()].time,
        active: stock.orderBlockStatus == OrderBlockStatus.active,
        label: 'Demand',
      ));
      final bearBottom = minLow + span * rng.range(0.68, 0.8);
      orderBlocks.add(OrderBlock(
        kind: OrderBlockKind.bearish,
        top: _r(bearBottom + span * 0.05),
        bottom: _r(bearBottom),
        from: candles[(candles.length * 0.45).floor()].time,
        active: true,
        label: 'Supply',
      ));
    }

    final liquidity = <LiquidityLevel>[
      LiquidityLevel(
        price: _r(maxHigh),
        label: 'Buy-side liquidity',
        isResistance: true,
        isSwing: true,
      ),
      LiquidityLevel(
        price: _r(minLow),
        label: 'Sell-side liquidity',
        isSwing: true,
      ),
      LiquidityLevel(
        price: _r(stock.vwap),
        label: 'VWAP',
      ),
      LiquidityLevel(
        price: _r(stock.previousClose),
        label: 'Prev. close',
        isResistance: stock.ltp < stock.previousClose,
      ),
    ];

    return TechnicalAnalysis(
      symbol: stock.symbol,
      trend: trend,
      momentum: momentum,
      vwapPosition: vwapPos,
      volume: volStatus,
      orderBlockStatus: stock.orderBlockStatus,
      bias: stock.direction,
      marketStructure: isBull
          ? 'Higher highs and higher lows — bullish structure intact.'
          : stock.direction == Direction.bearish
              ? 'Lower highs and lower lows — bearish structure.'
              : 'Range-bound between demand and supply.',
      liquidityContext: vwapPos == VwapPosition.above
          ? 'Trading above VWAP; buy-side liquidity rests at swing highs.'
          : 'Trading below VWAP; sell-side liquidity rests at swing lows.',
      orderBlocks: orderBlocks,
      liquidityLevels: liquidity,
      swingHighs: [_r(maxHigh), _r(maxHigh - span * 0.12)],
      swingLows: [_r(minLow), _r(minLow + span * 0.12)],
    );
  }

  TrendDirection _trend(double changePct, double strength) {
    if (changePct > 2.2 && strength > 70) return TrendDirection.strongUp;
    if (changePct > 0.3) return TrendDirection.up;
    if (changePct < -2.2 && strength < 30) return TrendDirection.strongDown;
    if (changePct < -0.3) return TrendDirection.down;
    return TrendDirection.sideways;
  }

  MomentumStatus _momentum(double strength, double volRatio) {
    if (strength > 72 && volRatio > 1.3) return MomentumStatus.accelerating;
    if (strength > 55) return MomentumStatus.steady;
    if (strength > 38) return MomentumStatus.fading;
    return MomentumStatus.weak;
  }

  double _r(double v) => double.parse(v.toStringAsFixed(2));
}
