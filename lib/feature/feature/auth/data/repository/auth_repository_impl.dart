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

  // Auth
  @override
  Future<NetworkResource<bool>> requestOtp({
    required String phone,
    required String authId,
  }) async {
    final response = await apiService.requestOTP(
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
    }
  }

  @override
  Future<NetworkResource<bool>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    final response = await apiService.verifyOTP(username: phone, otp: otp);

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
    }
  }

  @override
  Future<NetworkResource<bool>> resentOtp({
    required String phone,
    required String authId,
  }) async {
    final response = await apiService.resendOTP(
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
    }
  }

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

  @override
  Future<NetworkResource<bool>> register({
    required String prefix,
    required String phone,
    required String password,
    required String email,
  }) async {
    // todo:
    await Future.delayed(Duration(seconds: 2));
    await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.createPin);
    return NetworkSuccess(data: true);

    String brand = await deviceInfo.getDeviceBrand();
    String deviceUniqueId = await deviceInfo.getDeviceUniqueId();
    String osVersion = await deviceInfo.getDeviceOsVersion();
    String deviceModel = await deviceInfo.getDeviceModel();
    String deviceManufacturer = await deviceInfo.getDeviceManufacturer();

    final response = await apiService.register(
      prefix: prefix,
      phone: phone,
      password: password,
      email: email,
      longitude: '',
      latitude: '',
      appVersion: '001',
      ipAddress: '',
      brand: brand,
      deviceUniqueId: deviceUniqueId,
      osVersion: osVersion,
      deviceModel: deviceModel,
      deviceManufacturer: deviceManufacturer,
    );
    switch (response) {
      case NetworkSuccess<RegisterDto>():
        final successResponse = response.data?.data;
        if (successResponse != null) {
          final userData = toUserData(dto: successResponse, password: password);
          await appUserStore.saveUserData(userData);
          await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.createPin);
          final token = successResponse.accessToken ?? '';
          await appKeyStore.saveAccessToken(token);
          return NetworkSuccess(data: token.isNotEmpty);
        } else {
          return NetworkFailed(message: 'somethingWentWrong'.tr());
        }
      case NetworkFailed<RegisterDto>():
        return NetworkFailed(message: response.message);
    }
  }

  @override
  Future<UserData?> getUserData() async {
    return await appUserStore.getUserData();
  }

  @override
  Future<NetworkResource<bool>> createPin({required String pin}) async {
    // todo:
    await Future.delayed(Duration(seconds: 2));
    await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.landing);
    return NetworkSuccess(data: true);
  }
}
