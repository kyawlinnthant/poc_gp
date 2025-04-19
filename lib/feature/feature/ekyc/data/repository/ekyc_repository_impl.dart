import 'package:poc/data/store/app_data/app_launch_mode.dart';
import 'package:poc/feature/feature/ekyc/data/service/ekyc_service.dart';
import 'package:poc/feature/feature/ekyc/domain/repository/ekyc_repository.dart';

import '../../../../../data/device_info/device_info.dart';
import '../../../../../data/network/resource/network_resource.dart';
import '../../../../../data/network/resource/success_response.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../../../../data/store/keys_data/app_key_store.dart';
import '../../../../../data/store/user_data/app_user_store.dart';
import '../../../../../data/store/user_data/user_data.dart';

class EkycRepositoryImpl extends EkycRepository {
  final EkycApiService apiService;
  final AppUserStore appUserStore;
  final AppKeyStore appKeyStore;
  final AppDataStore appDataStore;
  final DeviceInfoRepository deviceInfo;

  EkycRepositoryImpl({
    required this.appUserStore,
    required this.appKeyStore,
    required this.appDataStore,
    required this.apiService,
    required this.deviceInfo,
  });

  // signup
  @override
  Future<NetworkResource<bool>> mock({
    required String prefix,
    required String phone,
    required String type,
  }) async {
    final response = await apiService.mock(
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

  // store
  @override
  Future<UserData?> getUserData() async {
    return await appUserStore.getUserData();
  }

  @override
  Future<bool> resetAuthFlow() async {
    await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.login);
    await appKeyStore.reset();
    await appUserStore.reset();
    return true;
  }

  @override
  Future<bool> eKycInAuth() async {
    return await appDataStore.loadAppLaunchMode() == AppLaunchMode.eKyc;
  }
}
