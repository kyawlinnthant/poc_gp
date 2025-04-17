import 'package:dio/dio.dart';
import 'package:poc/data/network/resource/safe_api_call.dart';
import 'package:poc/data/network/resource/success_response.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';

const String clientId = '418276b7f774b0ae0ae012e1d0c10d6a';

class AuthApiService {
  final DioClient dioClient;

  AuthApiService({required this.dioClient});

  /*
   {
    "mobile": "60412345678",
    "type":"4",

    "device_model":"0",
    "device_id":"0",
    "ip_address":"0",
    "latitude":"0",
    "longitude":"0"
  }
* */
  Future<NetworkResource<SuccessResponse>> requestSignupOTP({
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
          headers: {'client-id': clientId},
          contentType: Headers.jsonContentType,
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  /*
   {
    "mobile": "60412345678",
    "type": 2,

    "device_model":"-0",
    "device_id":"0",
    "ip_address":"0",
    "latitude":"0",
    "longitude":"0"
  }
  * */
  Future<NetworkResource<SuccessResponse>> verifySignupOTP({
    required String mobile,
    required int type,
    required String otp,

    required String deviceModel,
    required String deviceId,
    required String ipAddress,
    required String latitude,
    required String longitude,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/user/api/v1.0/users/send-verify-code',
        data: {
          'mobile': mobile,
          'type': type,
          'otp': otp,

          'device_model': deviceModel,
          'device_id': deviceId,
          'ip_address': ipAddress,
          'latitude': latitude,
          'longitude': longitude,
        },
        options: Options(
          headers: {'client-id': clientId},
          contentType: Headers.jsonContentType,
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  /*
  {
  "user_name": "60123456789",
  "email": "klt1@kiple.com",
  "country_pincode": "+60",
  "latitude": "40.7128",
  "longitude": "-74.0060",
  "app_version": "1.0.5",
  "ip_address": "192.168.1.10",
  "brand": "Samsung",
  "device_unique_id": "abc123xyz",
  "os_version": "Android 13",
  "device_model": "Galaxy S22",
  "manufacturer": "Samsung",
  "password": "Abcd@1234"
}
  * */
  Future<NetworkResource<SuccessResponse>> register({
    required String mobile,
    required String email,
    required String password,
    required String prefix,

    required String longitude,
    required String latitude,
    required String appVersion,
    required String ipAddress,
    required String brand,
    required String deviceUniqueId,
    required String osVersion,
    required String deviceModel,
    required String deviceManufacturer,
  }) async {
    return await safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/user/api/v2.0/users/registerv2',
        data: {
          'user_name': mobile,
          'email': email,
          'password': password,
          'country_pincode': "+$prefix",

          'latitude': latitude,
          'longitude': longitude,
          'app_version': appVersion,
          'ip_address': ipAddress,
          'brand': brand,
          'device_unique_id': deviceUniqueId,
          'os_version': osVersion,
          'device_model': deviceModel,
          'manufacturer': deviceManufacturer,
        },
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'client-id': '1'},
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  /*
  {
    "account": "600000000000",
    "type": 2,

    "device_model":"0",
    "device_id":"0",
    "ip_address":"0",
    "latitude":"0",
    "longitude":"0"
}
  * */
  Future<NetworkResource<SuccessResponse>> login({
    required String mobile,
    required int type,
    required String password,

    required String deviceModel,
    required String deviceId,
    required String ipAddress,
    required String latitude,
    required String longitude,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/user/api/v1.0/users/login',
        data: {
          'account': mobile,
          'type': type,
          'password': password,
          'device_model': deviceModel,
          'device_id': deviceId,
          'ip_address': ipAddress,
          'latitude': latitude,
          'longitude': longitude,
        },
        options: Options(
          headers: {
            'client-id': '1',
            'token': 'admin-ff7c318faf2c4558ae4661378c3a4a63',
          },
          contentType: Headers.jsonContentType,
        ),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }
}
