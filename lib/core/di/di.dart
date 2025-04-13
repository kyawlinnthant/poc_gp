import 'package:get_it/get_it.dart';
import 'package:poc/data/device_info/device_info.dart';
import 'package:poc/data/store/app_data/app_data_store.dart';
import 'package:poc/data/store/keys_data/app_key_store.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';
import 'package:poc/feature/feature/auth/data/di/auth_di.dart';
import 'package:poc/feature/feature/pin/data/di/pin_di.dart';

import '../../data/network/dio_client.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<AppDataStore>(() => AppDataStore());
  getIt.registerLazySingleton<AppKeyStore>(() => AppKeyStore());
  getIt.registerLazySingleton<AppUserStore>(() => AppUserStore());

  getIt.registerLazySingleton<DioClient>(() => DioClient());

  getIt.registerLazySingleton<DeviceInfoRepository>(
    () => DeviceInfoRepository(),
  );

  provideAuthDi();
  providePinDi();
}
