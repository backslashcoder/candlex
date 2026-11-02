import '../../../core/models/market_breadth.dart';
import '../../../core/models/market_index.dart';
import '../../../core/models/market_overview.dart';
import '../../../core/models/sector.dart';
import '../../../core/models/stock.dart';
import '../../../core/mock/market_data_store.dart';
import '../domain/market_repository.dart';

class MockMarketRepository implements MarketRepository {
  MockMarketRepository(this._store);

  final MarketDataStore _store;
  static const _latency = Duration(milliseconds: 280);

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<MarketOverview> getMarketOverview() async {
    await Future<void>.delayed(_latency);
    return _store.overview();
  }

  @override
  Future<List<Stock>> getBullishStocks() async {
    await Future<void>.delayed(_latency);
    return _store.bullish();
  }

  @override
  Future<List<Stock>> getBearishStocks() async {
    await Future<void>.delayed(_latency);
    return _store.bearish();
  }

  @override
  Future<MarketBreadth> getMarketBreadth() async {
    await Future<void>.delayed(_latency);
    return _store.breadth();
  }

  @override
  Future<List<SectorPerformance>> getSectorPerformance() async {
    await Future<void>.delayed(_latency);
    return _store.sectors();
  }

  @override
  Future<List<MarketIndex>> getIndices() async {
    await Future<void>.delayed(_latency);
    return _store.indices;
  }

  @override
  MarketOverview overviewNow() => _store.overview();
  @override
  List<Stock> bullishNow() => _store.bullish();
  @override
  List<Stock> bearishNow() => _store.bearish();
  @override
  List<SectorPerformance> sectorsNow() => _store.sectors();
}
