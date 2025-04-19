import 'package:poc/feature/feature/ekyc/data/repository/ekyc_repository_impl.dart';
import 'package:poc/feature/feature/ekyc/data/service/ekyc_service.dart';
import 'package:poc/feature/feature/ekyc/domain/repository/ekyc_repository.dart';

import '../../../../../core/di/di.dart';
import '../../../../../data/device_info/device_info.dart';
import '../../../../../data/network/dio_client.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../../../../data/store/keys_data/app_key_store.dart';
import '../../../../../data/store/user_data/app_user_store.dart';
import '../../presentation/start/bloc/ekyc_start_bloc.dart';

void provideEkycDi() {
  getIt.registerLazySingleton<EkycApiService>(
    () => EkycApiService(dioClient: getIt<DioClient>()),
  );

  getIt.registerLazySingleton<EkycRepository>(
    () => EkycRepositoryImpl(
      apiService: getIt<EkycApiService>(),
      appUserStore: getIt<AppUserStore>(),
      appKeyStore: getIt<AppKeyStore>(),
      appDataStore: getIt<AppDataStore>(),
      deviceInfo: getIt<DeviceInfoRepository>(),
    ),
  );
  _provideEkycBloc();
}

void _provideEkycBloc() {
  getIt.registerFactory<EkycStartBloc>(
    () => EkycStartBloc(repository: getIt<EkycRepository>()),
  );
}
