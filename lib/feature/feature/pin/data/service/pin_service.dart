import 'package:dio/dio.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/network/resource/safe_api_call.dart';
import '../../../../../data/network/resource/success_response.dart';

class PinApiService {
  final DioClient dioClient;

  PinApiService({required this.dioClient});

  /*
  * {
    "pin":"123456",
    "user_id": "3ac711617a4a4d45b0631c571597c814",
    "flag":3
  }
  * */
  Future<NetworkResource<SuccessResponse>> createPIN({
    required String userId,
    required String pin,
    required int flag,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/wallet/api/v1.0/publish/wallet/register',
        data: {'pin': pin, 'user_id': userId, 'flag': flag},
        options: Options(
          headers: {
            'X-Request-Id': '06b15d52e2bc42f3ad218bce0596cc38',
            'client-id': '186',
            'user_id': '43940',
          },
          contentType: Headers.jsonContentType,
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }
}
