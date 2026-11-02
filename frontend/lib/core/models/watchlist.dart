import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist.freezed.dart';
part 'watchlist.g.dart';

/// A user-managed named list of stock symbols. Persisted locally.
@freezed
abstract class Watchlist with _$Watchlist {
  const factory Watchlist({
    required String id,
    required String name,
    required List<String> symbols,
  }) = _Watchlist;

  factory Watchlist.fromJson(Map<String, dynamic> json) =>
      _$WatchlistFromJson(json);
}
