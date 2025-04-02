enum AppLanguage { english, myanmar }

extension AppLanguageExtension on AppLanguage {
  String get appLanguage {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.myanmar:
        return 'my';
    }
  }

  static AppLanguage fromAppLanguage(String name) {
    switch (name) {
      case 'en':
        return AppLanguage.english;
      case 'my':
        return AppLanguage.myanmar;
      default:
        return AppLanguage.english;
    }
  }
}
