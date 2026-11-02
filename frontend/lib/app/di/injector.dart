import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/mock/market_data_store.dart';
import '../../core/mock/market_simulator.dart';
import '../../features/overview/data/mock_market_repository.dart';
import '../../features/overview/domain/market_repository.dart';
import '../../features/scanner/data/mock_scanner_repository.dart';
import '../../features/scanner/domain/scanner_repository.dart';
import '../../features/signals/data/mock_strategy_repository.dart';
import '../../features/signals/domain/strategy_repository.dart';
import '../../features/stock_detail/data/mock_stock_detail_repository.dart';
import '../../features/stock_detail/domain/stock_detail_repository.dart';
import '../../features/telegram/data/mock_alert_repository.dart';
import '../../features/telegram/domain/alert_repository.dart';
import '../../features/tradeblock/data/mock_trade_block_repository.dart';
import '../../features/tradeblock/domain/trade_block_repository.dart';
import '../../features/watchlists/data/mock_watchlist_repository.dart';
import '../../features/watchlists/domain/watchlist_repository.dart';
import '../../features/settings/data/settings_service.dart';

final GetIt sl = GetIt.instance;

/// Wires the dependency graph. Repositories are registered against their
/// abstract contracts so swapping in live/API implementations is a one-line
/// change here.
Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Shared simulated data core.
  final store = MarketDataStore();
  sl.registerSingleton<MarketDataStore>(store);
  sl.registerSingleton<MarketSimulator>(MarketSimulator(store)..start());

  // Repositories (contract -> mock implementation).
  sl.registerLazySingleton<MarketRepository>(() => MockMarketRepository(sl()));
  sl.registerLazySingleton<ScannerRepository>(
      () => MockScannerRepository(sl()));
  sl.registerLazySingleton<StockDetailRepository>(
      () => MockStockDetailRepository(sl()));
  sl.registerLazySingleton<StrategyRepository>(
      () => MockStrategyRepository(sl()));
  sl.registerLazySingleton<TradeBlockRepository>(
      () => MockTradeBlockRepository(sl()));
  sl.registerLazySingleton<WatchlistRepository>(
      () => MockWatchlistRepository(sl()));
  sl.registerLazySingleton<AlertRepository>(() => MockAlertRepository(sl()));

  // Services.
  sl.registerSingleton<SettingsService>(SettingsService(prefs)..load());
}
