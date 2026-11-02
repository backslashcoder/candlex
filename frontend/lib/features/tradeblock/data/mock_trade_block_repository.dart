import '../../../core/mock/market_data_store.dart';
import '../domain/trade_block_board.dart';
import '../domain/trade_block_entry.dart';
import '../domain/trade_block_repository.dart';

/// Derives the TradeBlock flow board from the shared simulated market store.
/// Price direction is live; the open-interest change is a deterministic
/// simulated value (seeded per symbol) — see [TradeBlockEntry.fromStock].
class MockTradeBlockRepository implements TradeBlockRepository {
  MockTradeBlockRepository(this._store);

  final MarketDataStore _store;

  @override
  Stream<void> get ticks => _store.ticks;

  @override
  Future<TradeBlockBoard> getBoard() async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    return boardNow();
  }

  @override
  TradeBlockBoard boardNow() {
    final entries =
        _store.stocks.map(TradeBlockEntry.fromStock).toList(growable: false);
    return TradeBlockBoard(entries: entries);
  }
}
