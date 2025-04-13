import 'package:poc/data/device_info/device_info.dart';
import 'package:poc/data/store/app_data/app_data_store.dart';
import 'package:poc/data/store/keys_data/app_key_store.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';
import 'package:poc/feature/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:poc/feature/feature/auth/data/service/auth_api_service.dart';
import 'package:poc/feature/feature/auth/domain/repository/auth_repository.dart';
import 'package:poc/feature/feature/auth/presentation/signup/register/bloc/register_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../data/network/dio_client.dart';
import '../../presentation/login/bloc/login_bloc.dart';
import '../../presentation/password/otp/request/bloc/request_otp_bloc.dart';
import '../../presentation/password/otp/verify/bloc/otp_verify_bloc.dart';
import '../../presentation/password/reset/bloc/reset_password_bloc.dart';
import '../../presentation/signup/otp/request/bloc/request_otp_bloc.dart';
import '../../presentation/signup/otp/verify/bloc/otp_verify_bloc.dart';

void provideAuthDi() {
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(dioClient: getIt<DioClient>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      apiService: getIt<AuthApiService>(),
      appUserStore: getIt<AppUserStore>(),
      appKeyStore: getIt<AppKeyStore>(),
      appDataStore: getIt<AppDataStore>(),
      deviceInfo: getIt<DeviceInfoRepository>(),
    ),
  );
  _provideAuthBloc();
}

void _provideAuthBloc() {
  // login
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(repository: getIt<AuthRepository>()),
  );
  // signup
  getIt.registerFactory<OtpRequestSignupBloc>(
    () => OtpRequestSignupBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<OtpVerifySignupBloc>(
    () => OtpVerifySignupBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(repository: getIt<AuthRepository>()),
  );
  // password
  getIt.registerFactory<OtpRequestPasswordBloc>(
    () => OtpRequestPasswordBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<OtpVerifyPasswordBloc>(
    () => OtpVerifyPasswordBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<ResetPasswordBloc>(
    () => ResetPasswordBloc(repository: getIt<AuthRepository>()),
  );
}
