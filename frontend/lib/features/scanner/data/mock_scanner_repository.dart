import '../../../core/mock/market_data_store.dart';
import '../../../core/models/stock.dart';
import '../domain/scanner_repository.dart';

class MockScannerRepository implements ScannerRepository {
  MockScannerRepository(this._store);

  final MarketDataStore _store;

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<List<Stock>> getAllStocks() async {
    await Future<void>.delayed(const Duration(milliseconds: 260));
    return _store.stocks;
  }

  @override
  List<Stock> allStocksNow() => _store.stocks;
}
