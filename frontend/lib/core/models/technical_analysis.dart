import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';
import 'liquidity_level.dart';
import 'order_block.dart';

part 'technical_analysis.freezed.dart';
part 'technical_analysis.g.dart';

/// The computed technical read for a stock, shown in the analysis panel and
/// used to draw overlays on the chart.
@freezed
abstract class TechnicalAnalysis with _$TechnicalAnalysis {
  const factory TechnicalAnalysis({
    required String symbol,
    required TrendDirection trend,
    required MomentumStatus momentum,
    required VwapPosition vwapPosition,
    required VolumeStatus volume,
    required OrderBlockStatus orderBlockStatus,
    required Direction bias,
    required String marketStructure,
    required String liquidityContext,
    required List<OrderBlock> orderBlocks,
    required List<LiquidityLevel> liquidityLevels,
    @Default(<double>[]) List<double> swingHighs,
    @Default(<double>[]) List<double> swingLows,
  }) = _TechnicalAnalysis;

  factory TechnicalAnalysis.fromJson(Map<String, dynamic> json) =>
      _$TechnicalAnalysisFromJson(json);
}
