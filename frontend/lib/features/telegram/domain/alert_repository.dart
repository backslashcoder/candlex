import '../../../core/models/alert.dart';

abstract class AlertRepository {
  Future<List<Alert>> getAlerts();
  List<Alert> alertsNow();
  Stream<void> get ticks;
}
