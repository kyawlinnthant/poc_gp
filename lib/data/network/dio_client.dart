import 'package:dio/dio.dart';
import 'package:poc/data/network/interceptor/log_interceptor.dart';

import 'interceptor/header_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://util-staging.kiplepay.com:8080',
          headers: {
            'Accept': 'application/json; charset=utf-8',
            'Content-Type': 'application/json; charset=utf-8',
            'Accept-Language': 'US',
          },
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          validateStatus: (status) {
            return status != null;
          },
        ),
      ) {
    // _dio.interceptors.addAll([HeaderInterceptor(), LoggerInterceptor()]);
    _dio.interceptors.addAll([LoggerInterceptor()]);
  }

  Dio get dio => _dio;

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Response _handleDioError(DioException e) {
    throw Exception("Network error: ${e.response?.statusMessage ?? e.message}");
  }
}
