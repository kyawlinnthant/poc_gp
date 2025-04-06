import 'package:poc/data/store/app_data/app_data_store.dart';
import 'package:poc/data/store/keys_data/app_key_store.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';
import 'package:poc/feature/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:poc/feature/feature/auth/data/service/auth_api_service.dart';
import 'package:poc/feature/feature/auth/domain/repository/auth_repository.dart';
import 'package:poc/feature/feature/auth/presentation/otp_request/bloc/request_otp_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/otp_verify/bloc/verify_otp_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/bloc/signup_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../data/network/dio_client.dart';
import '../../presentation/login/bloc/login_bloc.dart';
import '../../presentation/otp_verify/resend/resend_cubit.dart';

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
    ),
  );
  _provideAuthBloc();
}

void _provideAuthBloc() {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<RequestOtpBloc>(
    () => RequestOtpBloc(repository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<VerifyOtpBloc>(
    () => VerifyOtpBloc(repository: getIt<AuthRepository>()),
  );
}
