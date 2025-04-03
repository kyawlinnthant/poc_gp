sealed class NetworkResource<T> {
  final T? data;

  const NetworkResource({this.data});
}

class NetworkSuccess<T> extends NetworkResource<T> {
  const NetworkSuccess({required T data}) : super(data: data);
}

class NetworkFailed<T> extends NetworkResource<T> {
  final String message;

  const NetworkFailed({required this.message});
}
