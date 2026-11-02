import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/view_status.dart';
import '../../../../core/enums.dart';
import '../../../../core/models/candle.dart';
import '../../../../core/models/stock.dart';
import '../../../../core/models/technical_analysis.dart';
import '../../domain/stock_detail_repository.dart';
import '../chart/chart_config.dart';

part 'stock_detail_state.dart';

class StockDetailCubit extends Cubit<StockDetailState> {
  StockDetailCubit(this._repo, {Timeframe initialTimeframe = Timeframe.m15})
      : super(StockDetailState(timeframe: initialTimeframe));

  final StockDetailRepository _repo;
  StreamSubscription<void>? _tickSub;
  String? _symbol;

  Future<void> load(String symbol) async {
    _symbol = symbol;
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final stock = await _repo.getStock(symbol);
      if (stock == null) {
        emit(state.copyWith(status: ViewStatus.error, error: 'Stock not found'));
        return;
      }
      final candles = await _repo.getCandles(symbol, state.timeframe);
      final analysis = await _repo.getTechnical(symbol, candles);
      emit(state.copyWith(
        status: ViewStatus.loaded,
        stock: stock,
        candles: candles,
        analysis: analysis,
      ));
      _tickSub ??= _repo.ticks.listen((_) => _refreshHeader());
    } catch (e) {
      emit(state.copyWith(status: ViewStatus.error, error: e.toString()));
    }
  }

  void _refreshHeader() {
    if (!state.status.isLoaded || _symbol == null) return;
    final live = _repo.stockNow(_symbol!);
    if (live != null) emit(state.copyWith(stock: live));
  }

  Future<void> changeTimeframe(Timeframe tf) async {
    if (tf == state.timeframe || _symbol == null) return;
    emit(state.copyWith(timeframe: tf));
    final candles = await _repo.getCandles(_symbol!, tf);
    final analysis = await _repo.getTechnical(_symbol!, candles);
    emit(state.copyWith(candles: candles, analysis: analysis));
  }

  void updateConfig(ChartOverlayConfig config) =>
      emit(state.copyWith(config: config));

  @override
  Future<void> close() {
    _tickSub?.cancel();
    return super.close();
  }
}
