import '../../../../core/models/candle.dart';
import '../../../../core/models/technical_analysis.dart';

/// Toggles for the chart overlays. Drives both the toolbar and the painter so
/// the chart integration stays in one place (no interop/painter scatter).
class ChartOverlayConfig {
  const ChartOverlayConfig({
    this.showVolume = true,
    this.showVwap = true,
    this.showEma9 = true,
    this.showEma21 = true,
    this.showOrderBlocks = true,
    this.showLiquidity = true,
    this.showSwings = false,
  });

  final bool showVolume;
  final bool showVwap;
  final bool showEma9;
  final bool showEma21;
  final bool showOrderBlocks;
  final bool showLiquidity;
  final bool showSwings;

  ChartOverlayConfig copyWith({
    bool? showVolume,
    bool? showVwap,
    bool? showEma9,
    bool? showEma21,
    bool? showOrderBlocks,
    bool? showLiquidity,
    bool? showSwings,
  }) {
    return ChartOverlayConfig(
      showVolume: showVolume ?? this.showVolume,
      showVwap: showVwap ?? this.showVwap,
      showEma9: showEma9 ?? this.showEma9,
      showEma21: showEma21 ?? this.showEma21,
      showOrderBlocks: showOrderBlocks ?? this.showOrderBlocks,
      showLiquidity: showLiquidity ?? this.showLiquidity,
      showSwings: showSwings ?? this.showSwings,
    );
  }
}

/// Bundles the data the chart renders.
class ChartData {
  const ChartData({required this.candles, this.analysis});
  final List<Candle> candles;
  final TechnicalAnalysis? analysis;
}
