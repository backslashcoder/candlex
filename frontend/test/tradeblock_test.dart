import 'package:candlex/core/cubit/view_status.dart';
import 'package:candlex/core/enums.dart';
import 'package:candlex/core/mock/market_data_store.dart';
import 'package:candlex/features/tradeblock/data/mock_trade_block_repository.dart';
import 'package:candlex/features/tradeblock/domain/oi_buildup.dart';
import 'package:candlex/features/tradeblock/presentation/cubit/trade_block_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OiBuildup.classify', () {
    test('maps price/OI quadrants to the correct build-up', () {
      expect(OiBuildupX.classify(1.2, 5), OiBuildup.longBuildup);
      expect(OiBuildupX.classify(-1.2, 5), OiBuildup.shortBuildup);
      expect(OiBuildupX.classify(1.2, -5), OiBuildup.shortCovering);
      expect(OiBuildupX.classify(-1.2, -5), OiBuildup.longUnwinding);
      expect(OiBuildupX.classify(0.0, 5), OiBuildup.neutral);
    });

    test('direction bias matches the build-up semantics', () {
      expect(OiBuildup.longBuildup.direction, Direction.bullish);
      expect(OiBuildup.shortCovering.direction, Direction.bullish);
      expect(OiBuildup.shortBuildup.direction, Direction.bearish);
      expect(OiBuildup.longUnwinding.direction, Direction.bearish);
    });
  });

  group('MockTradeBlockRepository / cubit', () {
    late MarketDataStore store;
    setUp(() => store = MarketDataStore());
    tearDown(() => store.dispose());

    test('board covers the full universe and partitions reconcile', () {
      final board = MockTradeBlockRepository(store).boardNow();
      expect(board.entries.length, store.stocks.length);
      final buckets = OiBuildup.values
          .map((b) => board.countFor(b))
          .reduce((a, b) => a + b);
      expect(buckets, board.entries.length);
    });

    test('entries are directionally consistent with their build-up', () {
      final board = MockTradeBlockRepository(store).boardNow();
      for (final e in board.bullish) {
        expect(e.direction, Direction.bullish);
      }
      for (final e in board.bearish) {
        expect(e.direction, Direction.bearish);
      }
    });

    test('cubit transitions initial -> loading -> loaded', () async {
      final cubit = TradeBlockCubit(MockTradeBlockRepository(store));
      expect(cubit.state.status, ViewStatus.initial);
      final future = cubit.load();
      expect(cubit.state.status, ViewStatus.loading);
      await future;
      expect(cubit.state.status, ViewStatus.loaded);
      expect(cubit.state.board.entries, isNotEmpty);
      await cubit.close();
    });

    test('select toggles and category filter drives featured column', () async {
      final cubit = TradeBlockCubit(MockTradeBlockRepository(store));
      await cubit.load();

      final sym = cubit.state.board.entries.first.symbol;
      cubit.select(sym);
      expect(cubit.state.selectedSymbol, sym);
      cubit.select(sym); // toggle off
      expect(cubit.state.selectedSymbol, isNull);

      cubit.setCategory(OiBuildup.longBuildup);
      expect(cubit.state.categoryFilter, OiBuildup.longBuildup);
      for (final e in cubit.state.featured) {
        expect(e.buildup, OiBuildup.longBuildup);
      }
      cubit.setCategory(OiBuildup.longBuildup); // toggle off
      expect(cubit.state.categoryFilter, isNull);
      await cubit.close();
    });
  });
}
