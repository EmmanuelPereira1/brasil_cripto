class GenericState<S, F> {
  S? data;
  F? error;
  Status status;

  bool get hasError => error != null;

  GenericState.loading({this.data, this.error, this.status = Status.loading});
  GenericState.success({this.data, this.error, this.status = Status.success});
  GenericState.failed({this.data, this.error, this.status = Status.failed});
}

enum Status { loading, failed, success }