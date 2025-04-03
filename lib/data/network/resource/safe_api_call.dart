import 'package:dio/dio.dart';

import 'error_response.dart';
import 'network_resource.dart';

Future<NetworkResource<T>> safeApiCall<T>({
  required Future<Response> dioRequest,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  try {
    final response = await dioRequest;

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return NetworkSuccess(data: fromJson(response.data));
    } else {
      final errorResponse = ErrorResponse.fromJson(response.data);
      return NetworkFailed(message: errorResponse.message);
    }
  } on DioException catch (e) {
    if (e.response != null) {
      final errorResponse = ErrorResponse.fromJson(e.response!.data);
      return NetworkFailed(message: errorResponse.message);
    } else {
      return NetworkFailed(message: 'Server error: ${e.message}');
    }
  } catch (e) {
    return NetworkFailed(message: 'Unexpected error: ${e.toString()}');
  }
}
