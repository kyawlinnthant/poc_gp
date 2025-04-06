import 'package:dio/dio.dart';
import 'package:poc/data/network/resource/safe_api_call.dart';
import 'package:poc/data/network/resource/success_response.dart';

import '../../../../../data/network/dio_client.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../dto/login_dto.dart';

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
        '/api/account/v3/user-register-v1-send-otp',
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
        '/api/account/v3/user-register-verify-otp',
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
        '/api/account/v3/user-register-v1-send-otp',
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

  Future<NetworkResource<bool>> register({
    required String country,
    required String firstName,
    required String lastName,
    required String phoneNo,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await safeApiCall<bool>(
      dioRequest: dioClient.post(
        '/api/Account/Register',
        data: {
          'AccountConfirmUrl':
              'https://destinyx.joeyyap.com/Account/Confirm.aspx',
          'Country': country,
          'FirstName': firstName,
          'LastName': lastName,
          'PhoneNo': phoneNo,
          'Email': email,
          'Password': password,
          'ConfirmPassword': confirmPassword,
        },
        options: Options(contentType: Headers.jsonContentType),
      ),
      fromJson: (json) {
        return true;
      },
    );
  }
}
