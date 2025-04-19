import 'package:dio/dio.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/network/resource/safe_api_call.dart';
import '../../../../../data/network/resource/success_response.dart';

class EkycApiService {
  final DioClient dioClient;

  EkycApiService({required this.dioClient});

  Future<NetworkResource<SuccessResponse>> mock({
    required String mobile,
    required String type,
    required String deviceModel,
    required String deviceId,
    required String ipAddress,
    required String latitude,
    required String longitude,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/user/api/v1.0/users/send-register-code',
        data: {
          'mobile': mobile,
          'type': type,

          'device_model': deviceModel,
          'device_id': deviceId,
          'ip_address': ipAddress,
          'latitude': latitude,
          'longitude': longitude,
        },
        options: Options(
          headers: {'client-id': ''},
          contentType: Headers.jsonContentType,
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }
}
