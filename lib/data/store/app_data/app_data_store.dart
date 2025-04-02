import 'package:poc/data/store/app_data/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_launch_mode.dart';

class AppDataStore {
  static const String _appLanguageKey = 'appLanguage';
  static const String _appLaunchModeKey = 'appLaunchMode';

  Future<void> saveAppLanguage({required AppLanguage language}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_appLanguageKey, language.name);
  }

  Future<AppLanguage> loadAppLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? modeName = prefs.getString(_appLanguageKey);
    return modeName != null
        ? AppLanguageExtension.fromAppLanguage(modeName)
        : AppLanguage.english;
  }

  Future<void> saveAppLaunchMode({required AppLaunchMode mode}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_appLaunchModeKey, mode.name);
  }

  Future<AppLaunchMode> loadAppLaunchMode() async {
    final prefs = await SharedPreferences.getInstance();
    final String? modeName = prefs.getString(_appLaunchModeKey);
    return modeName != null
        ? AppLaunchModeExtension.fromAppLaunchMode(modeName)
        : AppLaunchMode.onboard;
  }
}
