class SignalRRequest<T> {
  String methodName;
  void Function(List<Object>? objects) responseHandler;

  SignalRRequest(this.methodName, this.responseHandler);
}