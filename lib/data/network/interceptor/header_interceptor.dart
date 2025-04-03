import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/di/di.dart';

import '../../store/keys_data/app_key_store.dart';

class HeaderInterceptor extends Interceptor {
  final _keyStore = getIt<AppKeyStore>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await _keyStore.getAccessToken();
    debugPrint("TOKEN HEAD: $token");
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
