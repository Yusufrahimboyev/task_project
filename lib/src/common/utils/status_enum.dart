enum Status {
  intial,
  loading,
  success,
  error;

  bool get isIntial => this == intial;

  bool get isLoading => this == loading;

  bool get isSuccess => this == success;

  bool get isError => this == error;
}
