import 'package:flutter/material.dart';
import 'package:poc/data/store/user_data/app_user_store.dart';
import 'package:poc/data/store/user_data/user_data.dart';

import '../../../core/di/di.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = getIt<AppUserStore>();
    return Scaffold(
      appBar: AppBar(title: const Text("Landing")),
      body: SafeArea(
        child: FutureBuilder<UserData?>(
          future: userStore.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // Loading
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}')); // Error
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('No user data found.'),
              ); // Empty state
            } else {
              final user = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${user.prefix}${user.mobile}"),
                    Text("Email: ${user.email}"),
                    // Add more fields as needed
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// todo : setting change language
/*
* FilledButton(
                onPressed: () => changeLanguage(context, Locale('en')),
                child: Text("English"),
              ),
              ElevatedButton(
                onPressed: () => changeLanguage(context, Locale('my')),
                child: Text("မြန်မာ"),
              ),
              *
              * void changeLanguage(BuildContext context, Locale newLocale) async {
    // Change the language in EasyLocalization
    await context.setLocale(newLocale);
    final appDataStore = getIt.get<AppDataStore>();
    final newLang = AppLanguageExtension.fromAppLanguage(
      newLocale.languageCode,
    );
    await appDataStore.saveAppLanguage(language: newLang);
  }
* */
