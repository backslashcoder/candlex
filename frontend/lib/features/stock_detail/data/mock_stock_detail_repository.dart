import '../../../core/enums.dart';
import '../../../core/mock/candle_generator.dart';
import '../../../core/mock/market_data_store.dart';
import '../../../core/mock/technical_builder.dart';
import '../../../core/models/candle.dart';
import '../../../core/models/stock.dart';
import '../../../core/models/technical_analysis.dart';
import '../domain/stock_detail_repository.dart';

class MockStockDetailRepository implements StockDetailRepository {
  MockStockDetailRepository(this._store);

  final MarketDataStore _store;
  final CandleGenerator _candles = const CandleGenerator();
  final TechnicalBuilder _ta = const TechnicalBuilder();

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<Stock?> getStock(String symbol) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    return _store.stock(symbol);
  }

  @override
  Stock? stockNow(String symbol) => _store.stock(symbol);

  @override
  Future<List<Candle>> getCandles(String symbol, Timeframe timeframe) async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    final stock = _store.stock(symbol);
    final price = stock?.ltp ?? 1000;
    return _candles.generate(
      symbol: symbol,
      timeframe: timeframe,
      currentPrice: price,
    );
  }

  @override
  Future<TechnicalAnalysis> getTechnical(
      String symbol, List<Candle> candles) async {
    final stock = _store.stock(symbol);
    if (stock == null || candles.isEmpty) {
      throw StateError('No data for $symbol');
    }
    return _ta.build(stock, candles);
  }
}
