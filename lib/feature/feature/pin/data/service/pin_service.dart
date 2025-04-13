import 'package:dio/dio.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/network/resource/safe_api_call.dart';
import '../../../../../data/network/resource/success_response.dart';

class PinApiService {
  final DioClient dioClient;

  PinApiService({required this.dioClient});

  // create PIN, raw json request
  Future<NetworkResource<SuccessResponse>> createPIN({
    required String username,
    required String pin,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/api/account/v3/user-register-v1-send-request',
        data: {'UserName': username, 'Pin': pin},
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }
}
