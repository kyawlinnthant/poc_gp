import 'package:dio/dio.dart';
import 'package:poc/data/network/resource/safe_api_call.dart';
import 'package:poc/data/network/resource/success_response.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../dto/login_dto.dart';
import '../dto/register_dto.dart';

class AuthApiService {
  final DioClient dioClient;

  AuthApiService({required this.dioClient});

  // Auth
  Future<NetworkResource<SuccessResponse>> requestOTP({
    required String username,
    required String authId,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/api/account/v3/user-register-v1-send-request',
        data: {'UserName': username, 'AuthId': authId},
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  Future<NetworkResource<SuccessResponse>> verifyOTP({
    required String username,
    required String otp,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/api/account/v3/user-register-verify-request',
        data: {'UserName': username, 'Otp': otp},
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  Future<NetworkResource<SuccessResponse>> resendOTP({
    required String username,
    required String authId,
  }) async {
    return safeApiCall<SuccessResponse>(
      dioRequest: dioClient.post(
        '/api/account/v3/user-register-v1-send-request',
        data: {'UserName': username, 'AuthId': authId},
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) => SuccessResponse.fromJson(json),
    );
  }

  Future<NetworkResource<LoginDto>> login({
    required String username,
    required String password,
  }) async {
    return safeApiCall<LoginDto>(
      dioRequest: dioClient.post(
        '/Token',
        data: {
          'grant_type': 'password',
          'username': username,
          'password': password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      ),
      fromJson: (json) => LoginDto.fromJson(json),
    );
  }

  Future<NetworkResource<RegisterDto>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
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
    return await safeApiCall<RegisterDto>(
      dioRequest: dioClient.post(
        '/api/Account/Register',
        data: {
          'UserName': "$prefix$phone",
          'Password': password,
          'Email': email,
          'CountryPINCode': "+$prefix",
          'Country': '+60',
          'FullName': 'KLT',
          'Longtitude': longitude,
          'Latitude': latitude,
          'appversion': appVersion,
          'IpAddress': '',
          'brand': brand,
          'DeviceUniqueId': deviceUniqueId,
          'osversion': osVersion,
          'DeviceModel': deviceModel,
          'manufacturer': deviceManufacturer,
        },
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) => RegisterDto.fromJson(json),
    );
  }
}
