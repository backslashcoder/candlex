import 'package:candlex/core/enums.dart';
import 'package:candlex/core/models/stock.dart';
import 'package:candlex/core/widgets/stock_table.dart';
import 'package:candlex/features/scanner/domain/scanner_filter.dart';
import 'package:flutter_test/flutter_test.dart';

Stock _s(String sym, String sector, double chg, double strength,
    {double vol = 1}) {
  const prev = 100.0;
  final ltp = prev * (1 + chg / 100);
  return Stock(
    symbol: sym,
    name: sym,
    sector: sector,
    exchange: Exchange.nse,
    ltp: ltp,
    previousClose: prev,
    dayHigh: ltp + 1,
    dayLow: prev - 1,
    open: prev,
    volume: 1000 * vol,
    avgVolume: 1000,
    marketCap: 1e11,
    strengthScore: strength,
    liquidityScore: 50,
    vwap: prev,
  );
}

void main() {
  final universe = [
    _s('AAA', 'IT', 3, 85, vol: 2),
    _s('BBB', 'IT', -2, 20),
    _s('CCC', 'Banking', 1, 60),
    _s('DDD', 'Banking', -4, 15, vol: 0.5),
  ];

  group('ScannerTab predicates', () {
    test('bullish/bearish', () {
      expect(applyScanner(universe, ScannerTab.bullish, const ScannerFilter())
          .map((s) => s.symbol),
          containsAll(['AAA', 'CCC']));
      expect(applyScanner(universe, ScannerTab.bearish, const ScannerFilter())
          .map((s) => s.symbol),
          containsAll(['BBB', 'DDD']));
    });

    test('high momentum & volume spikes', () {
      expect(
          applyScanner(universe, ScannerTab.highMomentum, const ScannerFilter())
              .single
              .symbol,
          'AAA');
      expect(
          applyScanner(universe, ScannerTab.volumeSpikes, const ScannerFilter())
              .single
              .symbol,
          'AAA');
    });
  });

  group('ScannerFilter', () {
    test('sector + min strength', () {
      final f = const ScannerFilter(sector: 'Banking', minStrength: 50);
      final r = applyScanner(universe, ScannerTab.all, f);
      expect(r.single.symbol, 'CCC');
    });

    test('query matches symbol', () {
      final r = applyScanner(
          universe, ScannerTab.all, const ScannerFilter(query: 'aa'));
      expect(r.single.symbol, 'AAA');
    });

    test('hasActiveConstraints', () {
      expect(const ScannerFilter().hasActiveConstraints, isFalse);
      expect(const ScannerFilter(minStrength: 10).hasActiveConstraints, isTrue);
    });
  });

  group('sorting', () {
    test('sort by change descending', () {
      final sorted = universe.toList()
        ..sort((a, b) => -StockColumn.changePercent
            .sortValue(a)
            .compareTo(StockColumn.changePercent.sortValue(b)));
      expect(sorted.first.symbol, 'AAA');
      expect(sorted.last.symbol, 'DDD');
    });
  });
}
