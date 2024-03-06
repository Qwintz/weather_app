enum CubitStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == CubitStatus.initial;
  bool get isLoading => this == CubitStatus.loading;
  bool get isSuccess => this == CubitStatus.success;
  bool get isError => this == CubitStatus.error;
}

enum Language {
  russian("ru"),
  english("en");

  const Language(this.code);

  final String code;
}
