// Cross-feature domain enums.

enum Direction { bullish, bearish, neutral }

enum MarketSession { preMarket, open, closed, weekendHoliday }

enum TrendDirection { strongUp, up, sideways, down, strongDown }

enum MomentumStatus { accelerating, steady, fading, weak }

enum VwapPosition { above, at, below }

enum VolumeStatus { surge, high, normal, low }

enum OrderBlockStatus { active, mitigated, none }

enum SignalStatus {
  active,
  triggered,
  targetReached,
  invalidated,
  expired,
}

enum SignalConfidence { high, medium, low }

enum StrategyType {
  vwapTrendContinuation,
  openingRangeBreakout,
  orderBlockRetest,
  liquiditySweepReversal,
  momentumBreakout,
}

enum Exchange { nse, bse }

enum Timeframe { m1, m3, m5, m15, m30, h1, d1 }

enum OrderBlockKind { bullish, bearish }

extension DirectionX on Direction {
  bool get isBullish => this == Direction.bullish;
  bool get isBearish => this == Direction.bearish;
  String get label => switch (this) {
        Direction.bullish => 'Bullish',
        Direction.bearish => 'Bearish',
        Direction.neutral => 'Neutral',
      };
}

extension TimeframeX on Timeframe {
  String get label => switch (this) {
        Timeframe.m1 => '1m',
        Timeframe.m3 => '3m',
        Timeframe.m5 => '5m',
        Timeframe.m15 => '15m',
        Timeframe.m30 => '30m',
        Timeframe.h1 => '1h',
        Timeframe.d1 => '1D',
      };

  /// Approximate minutes per candle, used by the mock candle generator.
  int get minutes => switch (this) {
        Timeframe.m1 => 1,
        Timeframe.m3 => 3,
        Timeframe.m5 => 5,
        Timeframe.m15 => 15,
        Timeframe.m30 => 30,
        Timeframe.h1 => 60,
        Timeframe.d1 => 1440,
      };
}

extension StrategyTypeX on StrategyType {
  String get label => switch (this) {
        StrategyType.vwapTrendContinuation => 'VWAP Trend Continuation',
        StrategyType.openingRangeBreakout => 'Opening Range Breakout',
        StrategyType.orderBlockRetest => 'Order Block Retest',
        StrategyType.liquiditySweepReversal => 'Liquidity Sweep Reversal',
        StrategyType.momentumBreakout => 'Momentum Breakout',
      };

  String get shortLabel => switch (this) {
        StrategyType.vwapTrendContinuation => 'VWAP Trend',
        StrategyType.openingRangeBreakout => 'ORB',
        StrategyType.orderBlockRetest => 'OB Retest',
        StrategyType.liquiditySweepReversal => 'Liq. Sweep',
        StrategyType.momentumBreakout => 'Momentum',
      };
}

extension SignalStatusX on SignalStatus {
  String get label => switch (this) {
        SignalStatus.active => 'Active',
        SignalStatus.triggered => 'Triggered',
        SignalStatus.targetReached => 'Target Reached',
        SignalStatus.invalidated => 'Invalidated',
        SignalStatus.expired => 'Expired',
      };
}

extension MarketSessionX on MarketSession {
  String get label => switch (this) {
        MarketSession.preMarket => 'Pre-Market',
        MarketSession.open => 'Market Open',
        MarketSession.closed => 'Market Closed',
        MarketSession.weekendHoliday => 'Closed · Holiday',
      };
}
