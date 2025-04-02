import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/feature/ui/component/default_text_field.dart';
import 'package:poc/feature/ui/component/password_text_field.dart';
import 'package:poc/feature/ui/component/phone_text_field.dart';
import 'package:poc/feature/ui/spacer/vertical_spacer.dart';

import '../../../core/di/di.dart';
import '../../../data/store/app_data/app_data_store.dart';
import '../../../data/store/app_data/app_language.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => changeLanguage(context, Locale('en')),
                child: Text("English"),
              ),
              ElevatedButton(
                onPressed: () => changeLanguage(context, Locale('my')),
                child: Text("မြန်မာ"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeLanguage(BuildContext context, Locale newLocale) async {
    // Change the language in EasyLocalization
    await context.setLocale(newLocale);
    final appDataStore = getIt.get<AppDataStore>();
    final newLang = AppLanguageExtension.fromAppLanguage(
      newLocale.languageCode,
    );
    await appDataStore.saveAppLanguage(language: newLang);
  }
}
