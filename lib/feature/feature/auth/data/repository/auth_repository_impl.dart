import 'package:easy_localization/easy_localization.dart';
import 'package:poc/data/network/resource/success_response.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';

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

  AuthRepositoryImpl({
    required this.appUserStore,
    required this.appKeyStore,
    required this.appDataStore,
    required this.apiService,
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
    required String country,
    required String firstname,
    required String lastname,
    required String mobileNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await apiService.register(
      country: country,
      firstName: firstname,
      lastName: lastname,
      phoneNo: mobileNumber,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    switch (response) {
      case NetworkSuccess<bool>():
        return NetworkSuccess(data: true);
      case NetworkFailed<bool>():
        return NetworkFailed(message: response.message);
    }
  }
}
