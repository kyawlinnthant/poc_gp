sealed class NetworkResource<T> {
  final T? data;

  const NetworkResource({this.data});
}

class Success<T> extends NetworkResource<T> {
  const Success({required T data}) : super(data: data);
}

class Failed<T> extends NetworkResource<T> {
  final String message;

  const Failed({required this.message});
}
