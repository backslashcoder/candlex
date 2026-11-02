import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/watchlist.dart';
import '../domain/watchlist_repository.dart';

/// Persists watchlists locally via SharedPreferences. No backend dependency;
/// swap for a remote implementation later behind [WatchlistRepository].
class MockWatchlistRepository implements WatchlistRepository {
  MockWatchlistRepository(this._prefs);

  final SharedPreferences _prefs;
  static const _key = 'candlex.watchlists.v1';

  static final List<Watchlist> _defaults = [
    const Watchlist(
      id: 'default',
      name: 'My Watchlist',
      symbols: ['RELIANCE', 'HDFCBANK', 'INFY', 'TATAMOTORS', 'SBIN'],
    ),
    const Watchlist(
      id: 'momentum',
      name: 'Momentum Leaders',
      symbols: ['BAJFINANCE', 'MARUTI', 'LT', 'TITAN'],
    ),
  ];

  @override
  Future<List<Watchlist>> getWatchlists() async {
    final raw = _prefs.getString(_key);
    if (raw == null) {
      await saveAll(_defaults);
      return _defaults;
    }
    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((e) => Watchlist.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return _defaults;
    }
  }

  @override
  Future<void> saveAll(List<Watchlist> watchlists) async {
    final encoded = jsonEncode(watchlists.map((w) => w.toJson()).toList());
    await _prefs.setString(_key, encoded);
  }
}
