import 'package:easy_localization/easy_localization.dart';
import 'package:poc/data/device_info/device_info.dart';
import 'package:poc/data/network/resource/success_response.dart';
import 'package:poc/data/store/app_data/app_launch_mode.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';
import 'package:poc/data/store/user_data/user_data.dart';
import 'package:poc/feature/feature/auth/data/dto/register_dto.dart';

import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../../../../data/store/keys_data/app_key_store.dart';
import '../../domain/repository/auth_repository.dart';
import '../dto/login_dto.dart';
import '../service/auth_api_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService apiService;
  final AppUserStore appUserStore;
  final AppKeyStore appKeyStore;
  final AppDataStore appDataStore;
  final DeviceInfoRepository deviceInfo;

  AuthRepositoryImpl({
    required this.appUserStore,
    required this.appKeyStore,
    required this.appDataStore,
    required this.apiService,
    required this.deviceInfo,
  });

  // signup
  @override
  Future<NetworkResource<bool>> requestOtpSignup({
    required String prefix,
    required String phone,
    required String type,
  }) async {
    final response = await apiService.requestSignupOTP(
      mobile: '$prefix$phone',
      type: type,
      deviceModel: '0',
      deviceId: '0',
      ipAddress: '0',
      latitude: '0',
      longitude: '0',
    );

    switch (response) {
      case NetworkSuccess<SuccessResponse>():
        final data = response.data!;
        if (checkResponse(message: data.message)) {
          return NetworkSuccess(data: true);
        } else {
          return NetworkFailed(message: data.message);
        }

      case NetworkFailed<SuccessResponse>():
        return NetworkFailed(message: response.message);
    }
  }

  @override
  Future<NetworkResource<bool>> verifyOtpSignup({
    required String prefix,
    required String phone,
    required int type,
    required String otp,
  }) async {
    final response = await apiService.verifySignupOTP(
      mobile: '$prefix$phone',
      type: type,
      otp: otp,
      deviceModel: '0',
      deviceId: '0',
      ipAddress: '0',
      latitude: '0',
      longitude: '0',
    );

    switch (response) {
      case NetworkSuccess<SuccessResponse>():
        final data = response.data!;
        if (checkResponse(message: data.message)) {
          return NetworkSuccess(data: true);
        } else {
          return NetworkFailed(message: data.message);
        }

      case NetworkFailed<SuccessResponse>():
        return NetworkFailed(message: response.message);
    }
  }

  @override
  Future<NetworkResource<bool>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
  }) async {
    String brand = await deviceInfo.getDeviceBrand();
    String deviceUniqueId = await deviceInfo.getDeviceUniqueId();
    String osVersion = await deviceInfo.getDeviceOsVersion();
    String deviceModel = await deviceInfo.getDeviceModel();
    String deviceManufacturer = await deviceInfo.getDeviceManufacturer();

    final response = await apiService.register(
      mobile: '$prefix$phone',
      prefix: prefix,
      password: password,
      email: email,

      longitude: '0',
      latitude: '0',
      appVersion: '001',
      ipAddress: '0',
      brand: brand,
      deviceUniqueId: deviceUniqueId,
      osVersion: osVersion,
      deviceModel: deviceModel,
      deviceManufacturer: deviceManufacturer,
    );
    switch (response) {
      case NetworkSuccess<SuccessResponse>():
        final success = response.data!;
        if (checkResponse(message: success.message)) {
          final registerResponse = response.data?.data;
          RegisterDto dto = RegisterDto.fromJson(registerResponse);
          final userData = toUserData(
            dto: dto,
            password: password,
            prefix: prefix,
          );
          await appUserStore.saveUserData(userData);
          await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.createPin);
          final token = dto.token;
          final userId = dto.userId;
          await appKeyStore.saveUserId(userId);
          await appKeyStore.saveAccessToken(token);
          return NetworkSuccess(data: true);
        } else {
          return NetworkFailed(
            message: response.data?.message ?? 'somethingWentWrong'.tr(),
          );
        }

      case NetworkFailed<SuccessResponse>():
        return NetworkFailed(message: response.message);
    }
  }

  @override
  Future<NetworkResource<bool>> resentOtpSignup({
    required String phone,
    required String authId,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return NetworkSuccess(data: true);

    /*final response = await apiService.resendOTP(
      username: phone,
      authId: authId,
    );

    switch (response) {
      case NetworkSuccess<SuccessResponse>():
        final data = response.data!;
        if (data.success) {
          return NetworkSuccess(data: data.success);
        } else {
          return NetworkFailed(
            message: data.message ?? 'somethingWentWrong'.tr(),
          );
        }

      case NetworkFailed<SuccessResponse>():
        return NetworkFailed(message: response.message);
    }*/
  }

  // password

  @override
  Future<NetworkResource<bool>> requestOtpPassword({
    required String phone,
    required String authId,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return NetworkSuccess(data: true);
  }

  @override
  Future<NetworkResource<bool>> verifyOtpPassword({
    required String phone,
    required String otp,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return NetworkSuccess(data: true);
  }

  @override
  Future<NetworkResource<bool>> resentOtpPassword({
    required String phone,
    required String authId,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return NetworkSuccess(data: true);
  }

  @override
  Future<NetworkResource<bool>> resetPassword({
    required String prefix,
    required String phone,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return NetworkSuccess(data: true);
  }

  // login
  @override
  Future<NetworkResource<LoginDto>> login({
    required String phone,
    required String password,
  }) async {
    // todo:
    await Future.delayed(Duration(seconds: 2));

    return NetworkFailed(message: "Something went wrong!");

    final response = await apiService.login(
      username: phone,
      password: password,
    );

    if (response is NetworkSuccess<LoginDto>) {
      final data = response.data!;
      if (data.accessToken.isNotEmpty) {
        // await prefService.setToken(token: data.accessToken);
        // await prefService.setUsername(name: data.username);
        // await prefService.setEmail(email: data.email);
        // await prefService.setIsAuthenticated(true);
      }
    }
    return response;
  }

  // store
  @override
  Future<UserData?> getUserData() async {
    return await appUserStore.getUserData();
  }
}
