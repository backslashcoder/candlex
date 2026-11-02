import 'trade_block_board.dart';

/// Contract for the TradeBlock data source. The mock implementation derives the
/// board from the shared simulated store; a live OI/price feed can replace it
/// without touching the presentation layer.
abstract class TradeBlockRepository {
  Future<TradeBlockBoard> getBoard();

  /// Synchronous latest snapshot, read on each simulated tick.
  TradeBlockBoard boardNow();

  Stream<void> get ticks;
}
