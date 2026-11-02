import '../../../core/enums.dart';
import '../../../core/models/stock.dart';

/// Preset scanner tabs, each a named predicate over the universe.
enum ScannerTab {
  all,
  bullish,
  bearish,
  highMomentum,
  volumeSpikes,
  highLiquidity,
  nearVwap,
  orderBlockRetests,
}

extension ScannerTabX on ScannerTab {
  String get label => switch (this) {
        ScannerTab.all => 'All Stocks',
        ScannerTab.bullish => 'Bullish',
        ScannerTab.bearish => 'Bearish',
        ScannerTab.highMomentum => 'High Momentum',
        ScannerTab.volumeSpikes => 'Volume Spikes',
        ScannerTab.highLiquidity => 'High Liquidity',
        ScannerTab.nearVwap => 'Near VWAP',
        ScannerTab.orderBlockRetests => 'Order Block Retests',
      };

  bool matches(Stock s) => switch (this) {
        ScannerTab.all => true,
        ScannerTab.bullish => s.direction == Direction.bullish,
        ScannerTab.bearish => s.direction == Direction.bearish,
        ScannerTab.highMomentum => s.strengthScore >= 70,
        ScannerTab.volumeSpikes => s.volumeRatio >= 1.5,
        ScannerTab.highLiquidity => s.liquidityScore >= 60,
        ScannerTab.nearVwap => s.isNearVwap,
        ScannerTab.orderBlockRetests =>
          s.orderBlockStatus == OrderBlockStatus.active,
      };
}

/// Combined advanced filter. All constraints are ANDed together.
class ScannerFilter {
  const ScannerFilter({
    this.query = '',
    this.exchange,
    this.sector,
    this.direction,
    this.minStrength = 0,
    this.minVolumeRatio = 0,
    this.minLiquidity = 0,
    this.minChangePercent,
    this.maxChangePercent,
    this.minPrice,
    this.maxPrice,
  });

  final String query;
  final Exchange? exchange;
  final String? sector;
  final Direction? direction;
  final double minStrength;
  final double minVolumeRatio;
  final double minLiquidity;
  final double? minChangePercent;
  final double? maxChangePercent;
  final double? minPrice;
  final double? maxPrice;

  ScannerFilter copyWith({
    String? query,
    Exchange? exchange,
    bool clearExchange = false,
    String? sector,
    bool clearSector = false,
    Direction? direction,
    bool clearDirection = false,
    double? minStrength,
    double? minVolumeRatio,
    double? minLiquidity,
    double? minChangePercent,
    double? maxChangePercent,
    double? minPrice,
    double? maxPrice,
  }) {
    return ScannerFilter(
      query: query ?? this.query,
      exchange: clearExchange ? null : (exchange ?? this.exchange),
      sector: clearSector ? null : (sector ?? this.sector),
      direction: clearDirection ? null : (direction ?? this.direction),
      minStrength: minStrength ?? this.minStrength,
      minVolumeRatio: minVolumeRatio ?? this.minVolumeRatio,
      minLiquidity: minLiquidity ?? this.minLiquidity,
      minChangePercent: minChangePercent ?? this.minChangePercent,
      maxChangePercent: maxChangePercent ?? this.maxChangePercent,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  bool get hasActiveConstraints =>
      exchange != null ||
      sector != null ||
      direction != null ||
      minStrength > 0 ||
      minVolumeRatio > 0 ||
      minLiquidity > 0 ||
      minChangePercent != null ||
      maxChangePercent != null ||
      minPrice != null ||
      maxPrice != null;

  bool matches(Stock s) {
    if (query.isNotEmpty) {
      final q = query.toLowerCase();
      if (!s.symbol.toLowerCase().contains(q) &&
          !s.name.toLowerCase().contains(q)) {
        return false;
      }
    }
    if (exchange != null && s.exchange != exchange) return false;
    if (sector != null && s.sector != sector) return false;
    if (direction != null && s.direction != direction) return false;
    if (s.strengthScore < minStrength) return false;
    if (s.volumeRatio < minVolumeRatio) return false;
    if (s.liquidityScore < minLiquidity) return false;
    if (minChangePercent != null && s.changePercent < minChangePercent!) {
      return false;
    }
    if (maxChangePercent != null && s.changePercent > maxChangePercent!) {
      return false;
    }
    if (minPrice != null && s.ltp < minPrice!) return false;
    if (maxPrice != null && s.ltp > maxPrice!) return false;
    return true;
  }
}

/// Applies a tab + filter to the universe. Pure and unit-testable.
List<Stock> applyScanner(
  List<Stock> stocks,
  ScannerTab tab,
  ScannerFilter filter,
) {
  return stocks.where((s) => tab.matches(s) && filter.matches(s)).toList();
}
