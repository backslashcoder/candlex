import '../../../core/enums.dart';
import '../../../core/models/candle.dart';
import '../../../core/models/stock.dart';
import '../../../core/models/technical_analysis.dart';

abstract class StockDetailRepository {
  Future<Stock?> getStock(String symbol);
  Future<List<Candle>> getCandles(String symbol, Timeframe timeframe);
  Future<TechnicalAnalysis> getTechnical(String symbol, List<Candle> candles);
  Stock? stockNow(String symbol);
  Stream<void> get ticks;
}
