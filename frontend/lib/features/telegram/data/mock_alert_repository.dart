import '../../../core/mock/market_data_store.dart';
import '../../../core/models/alert.dart';
import '../domain/alert_repository.dart';

class MockAlertRepository implements AlertRepository {
  MockAlertRepository(this._store);

  final MarketDataStore _store;

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<List<Alert>> getAlerts() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _store.alerts;
  }

  @override
  List<Alert> alertsNow() => _store.alerts;
}
