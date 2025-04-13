import 'package:poc/feature/feature/pin/data/repository/pin_repository_impl.dart';
import 'package:poc/feature/feature/pin/data/service/pin_service.dart';
import 'package:poc/feature/feature/pin/domain/repostiory/pin_repository.dart';

import '../../../../../core/di/di.dart';
import '../../../../../data/network/dio_client.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../presentation/confirm/bloc/confirm_pin_bloc.dart';
import '../../presentation/create/bloc/create_pin_bloc.dart';

void providePinDi() {
  getIt.registerLazySingleton<PinApiService>(
    () => PinApiService(dioClient: getIt<DioClient>()),
  );

  getIt.registerLazySingleton<PinRepository>(
    () => PinRepositoryImpl(
      apiService: getIt<PinApiService>(),
      appDataStore: getIt<AppDataStore>(),
    ),
  );
  _providePinBloc();
}

void _providePinBloc() {
  getIt.registerFactory<CreatePinBloc>(
    () => CreatePinBloc(repository: getIt<PinRepository>()),
  );
  getIt.registerFactory<ConfirmPinBloc>(
    () => ConfirmPinBloc(repository: getIt<PinRepository>()),
  );
}
