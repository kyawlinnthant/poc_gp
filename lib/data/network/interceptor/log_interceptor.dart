import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("🚀 [REQUEST] ${options.method} ${options.uri}");
    debugPrint("📤 Headers: ${options.headers}");
    debugPrint("📤 Body: ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      "✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}",
    );
    debugPrint("📥 Data: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      "❌ [ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}",
    );
    debugPrint("⚠️ Message: ${err.message}");
    super.onError(err, handler);
  }
}
