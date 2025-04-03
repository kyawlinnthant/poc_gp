import 'dart:developer';

import 'package:dio/dio.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      "🚀 [REQUEST]\n\n "
      "URI      :${options.uri} \n "
      "METHOD   :${options.method} \n "
      "HEADERS  :${options.headers} \n "
      "DATA     :${options.data} \n\n ",
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      "✅ [RESPONSE]\n\n "
      "URI          :${response.requestOptions.uri} \n "
      "STATUS CODE  :${response.statusCode} \n "
      "HEADERS      :${response.headers} \n "
      "MESSAGE      :${response.statusMessage} \n "
      "DATA         :${response.data} \n\n ",
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      "❌ [ERROR]\n\n "
      "URI          :${err.requestOptions.uri} \n "
      "STATUS CODE  :${err.response?.statusCode} \n "
      "HEADERS      :${err.response?.headers} \n "
      "MESSAGE      :${err.response?.statusMessage} \n "
      "DATA         :${err.response?.data} \n\n ",
    );
    super.onError(err, handler);
  }
}
