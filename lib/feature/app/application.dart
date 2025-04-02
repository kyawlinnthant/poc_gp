import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/navigation/app_router.dart';

import '../../core/theme/app_m3_theme.dart';

class PocApplication extends StatelessWidget {
  const PocApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GREEN PACKET POC',
      routerConfig: appNavigator,
      theme: AppMaterial3Theme().light(),
      darkTheme: AppMaterial3Theme().dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
