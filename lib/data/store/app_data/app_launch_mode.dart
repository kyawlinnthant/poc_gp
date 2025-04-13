enum AppLaunchMode { onboard, login, createPin, eKyc, landing }

extension AppLaunchModeExtension on AppLaunchMode {
  String get appLaunchMode {
    switch (this) {
      case AppLaunchMode.onboard:
        return 'onboard';
      case AppLaunchMode.login:
        return 'login';
      case AppLaunchMode.createPin:
        return 'createPin';
      case AppLaunchMode.landing:
        return 'landing';
      case AppLaunchMode.eKyc:
        return 'eKyc';
    }
  }

  static AppLaunchMode fromAppLaunchMode(String name) {
    switch (name) {
      case 'onboard':
        return AppLaunchMode.onboard;
      case 'login':
        return AppLaunchMode.login;
      case 'createPin':
        return AppLaunchMode.createPin;
      case 'eKyc':
        return AppLaunchMode.eKyc;
      case 'landing':
        return AppLaunchMode.landing;
      default:
        return AppLaunchMode.onboard;
    }
  }
}
