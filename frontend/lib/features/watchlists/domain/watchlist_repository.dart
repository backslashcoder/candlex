import '../../../core/models/watchlist.dart';

abstract class WatchlistRepository {
  Future<List<Watchlist>> getWatchlists();
  Future<void> saveAll(List<Watchlist> watchlists);
}
