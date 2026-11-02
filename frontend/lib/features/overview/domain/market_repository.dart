import '../../../core/models/market_breadth.dart';
import '../../../core/models/market_index.dart';
import '../../../core/models/market_overview.dart';
import '../../../core/models/sector.dart';
import '../../../core/models/stock.dart';

/// Contract for market-level data. A live API/WebSocket implementation can be
/// substituted for the mock one via DI without touching the presentation layer.
abstract class MarketRepository {
  Future<MarketOverview> getMarketOverview();
  Future<List<Stock>> getBullishStocks();
  Future<List<Stock>> getBearishStocks();
  Future<MarketBreadth> getMarketBreadth();
  Future<List<SectorPerformance>> getSectorPerformance();
  Future<List<MarketIndex>> getIndices();

  /// Synchronous live snapshots for tick-driven refreshes.
  MarketOverview overviewNow();
  List<Stock> bullishNow();
  List<Stock> bearishNow();
  List<SectorPerformance> sectorsNow();

  Stream<void> get ticks;
}
