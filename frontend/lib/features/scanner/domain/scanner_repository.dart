import '../../../core/models/stock.dart';

abstract class ScannerRepository {
  Future<List<Stock>> getAllStocks();
  List<Stock> allStocksNow();
  Stream<void> get ticks;
}
