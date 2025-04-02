import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HeaderInterceptor extends Interceptor {
  // todo : secure pref
  // final SharedPreferencesService _prefsService =
  //     getIt<SharedPreferencesService>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // String token = await _prefsService.getToken();
    String token = "";
    debugPrint("TOKEN HEAD: $token");
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
