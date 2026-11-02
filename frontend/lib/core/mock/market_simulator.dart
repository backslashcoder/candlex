import 'dart:async';

import 'market_data_store.dart';

/// Drives periodic simulated updates on the [MarketDataStore]. A single
/// app-wide timer avoids each Cubit spinning its own; Cubits subscribe to the
/// store's tick stream instead. Replaceable with a WebSocket feed later.
class MarketSimulator {
  MarketSimulator(this._store);

  final MarketDataStore _store;
  Timer? _timer;

  static const Duration interval = Duration(milliseconds: 1500);

  bool get isRunning => _timer?.isActive ?? false;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => _store.applyTick());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
  }
}
