import 'package:candlex/core/cubit/view_status.dart';
import 'package:candlex/core/mock/market_data_store.dart';
import 'package:candlex/core/models/watchlist.dart';
import 'package:candlex/features/overview/data/mock_market_repository.dart';
import 'package:candlex/features/overview/presentation/cubit/overview_cubit.dart';
import 'package:candlex/features/scanner/data/mock_scanner_repository.dart';
import 'package:candlex/features/scanner/domain/scanner_filter.dart';
import 'package:candlex/features/scanner/presentation/cubit/scanner_cubit.dart';
import 'package:candlex/features/watchlists/domain/watchlist_repository.dart';
import 'package:candlex/features/watchlists/presentation/cubit/watchlist_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class _InMemoryWatchlistRepo implements WatchlistRepository {
  List<Watchlist> _data = [
    const Watchlist(id: 'default', name: 'Default', symbols: ['RELIANCE']),
  ];

  @override
  Future<List<Watchlist>> getWatchlists() async => _data;

  @override
  Future<void> saveAll(List<Watchlist> watchlists) async => _data = watchlists;
}

void main() {
  late MarketDataStore store;
  setUp(() => store = MarketDataStore());
  tearDown(() => store.dispose());

  test('OverviewCubit transitions initial -> loading -> loaded', () async {
    final cubit = OverviewCubit(MockMarketRepository(store));
    expect(cubit.state.status, ViewStatus.initial);
    final future = cubit.load();
    expect(cubit.state.status, ViewStatus.loading);
    await future;
    expect(cubit.state.status, ViewStatus.loaded);
    expect(cubit.state.bullish, isNotEmpty);
    expect(cubit.state.sectors, isNotEmpty);
    await cubit.close();
  });

  test('ScannerCubit tab + filter drive visible results', () async {
    final cubit = ScannerCubit(MockScannerRepository(store));
    await cubit.load();
    expect(cubit.state.status, ViewStatus.loaded);

    cubit.setTab(ScannerTab.bullish);
    final bullCount = cubit.state.visible.length;
    expect(bullCount, greaterThan(0));

    cubit.setFilter(const ScannerFilter(minStrength: 95));
    expect(cubit.state.visible.length, lessThanOrEqualTo(bullCount));

    cubit.resetFilter();
    expect(cubit.state.filter.hasActiveConstraints, isFalse);
    await cubit.close();
  });

  test('WatchlistCubit create/add/remove persists', () async {
    final cubit = WatchlistCubit(_InMemoryWatchlistRepo(), store);
    await cubit.load();
    expect(cubit.state.watchlists, hasLength(1));

    await cubit.createWatchlist('Energy');
    expect(cubit.state.watchlists, hasLength(2));
    final id = cubit.state.selectedId!;

    await cubit.addSymbol(id, 'ONGC');
    expect(cubit.state.watchlists.firstWhere((w) => w.id == id).symbols,
        contains('ONGC'));

    await cubit.removeSymbol(id, 'ONGC');
    expect(cubit.state.watchlists.firstWhere((w) => w.id == id).symbols,
        isNot(contains('ONGC')));

    await cubit.deleteWatchlist(id);
    expect(cubit.state.watchlists, hasLength(1));
    await cubit.close();
  });
}
