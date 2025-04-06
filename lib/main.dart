import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/core/di/di.dart';
import 'package:poc/data/store/app_data/app_language.dart';

import 'data/store/app_data/app_data_store.dart';
import 'feature/app/application.dart';
import 'feature/feature/auth/presentation/otp_verify/resend/resend_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDi();
  // Get the stored language
  final appDataStore = getIt.get<AppDataStore>();
  final appLanguage = await appDataStore.loadAppLanguage();

  // Convert AppLanguage to Locale
  final startLocale = Locale(appLanguage.appLanguage);
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CountdownCubit())],
      child: EasyLocalization(
        supportedLocales: [
          Locale(AppLanguage.english.appLanguage), // ✅ English
          Locale(AppLanguage.myanmar.appLanguage), // ✅ Burmese
        ],
        path: 'assets/lang',
        fallbackLocale: Locale(AppLanguage.english.appLanguage),
        startLocale: startLocale,
        child: PocApplication(),
      ),
    ),
  );
}
