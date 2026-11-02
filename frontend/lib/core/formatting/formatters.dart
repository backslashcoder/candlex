import 'package:intl/intl.dart';

/// Number / currency / date formatting helpers using Indian conventions
/// where appropriate (lakh / crore grouping, ₹ symbol).
class Formatters {
  const Formatters._();

  static final NumberFormat _price = NumberFormat('#,##,##0.00', 'en_IN');
  static final NumberFormat _priceWhole = NumberFormat('#,##,##0', 'en_IN');
  static final NumberFormat _compactInr = NumberFormat.compactCurrency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );
  static final DateFormat _time = DateFormat('HH:mm:ss');
  static final DateFormat _dateTime = DateFormat('dd MMM yyyy, HH:mm');
  static final DateFormat _date = DateFormat('dd MMM yyyy');
  static final DateFormat _shortTime = DateFormat('HH:mm');

  /// `1,23,456.78`
  static String price(double value) => _price.format(value);

  /// `₹1,23,456.78`
  static String currency(double value) => '₹${_price.format(value)}';

  static String priceWhole(double value) => _priceWhole.format(value);

  /// `+1.24%` / `-0.80%` with explicit sign.
  static String percent(double value, {int decimals = 2}) {
    final sign = value > 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(decimals)}%';
  }

  /// `+12.40` / `-3.10` absolute change with sign.
  static String change(double value) {
    final sign = value > 0 ? '+' : '';
    return '$sign${_price.format(value)}';
  }

  /// Compact volume: 12.3L (lakh), 4.5Cr (crore), 980 otherwise.
  static String compactQty(num value) {
    final v = value.abs();
    if (v >= 10000000) return '${(value / 10000000).toStringAsFixed(2)}Cr';
    if (v >= 100000) return '${(value / 100000).toStringAsFixed(2)}L';
    if (v >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    return value.toStringAsFixed(0);
  }

  /// Compact INR market cap.
  static String marketCap(double value) => _compactInr.format(value);

  static String ratio(double value, {int decimals = 2}) =>
      '${value.toStringAsFixed(decimals)}x';

  static String score(double value) => value.toStringAsFixed(0);

  static String time(DateTime dt) => _time.format(dt);
  static String shortTime(DateTime dt) => _shortTime.format(dt);
  static String dateTime(DateTime dt) => _dateTime.format(dt);
  static String date(DateTime dt) => _date.format(dt);
}
