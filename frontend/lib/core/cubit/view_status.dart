/// Common loading status used by feature states.
enum ViewStatus { initial, loading, loaded, error }

extension ViewStatusX on ViewStatus {
  bool get isInitial => this == ViewStatus.initial;
  bool get isLoading => this == ViewStatus.loading;
  bool get isLoaded => this == ViewStatus.loaded;
  bool get isError => this == ViewStatus.error;
}
