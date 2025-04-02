enum AppLaunchMode { onboard, auth, landing }

extension AppLaunchModeExtension on AppLaunchMode {
  String get appLaunchMode {
    switch (this) {
      case AppLaunchMode.onboard:
        return 'onboard';
      case AppLaunchMode.auth:
        return 'auth';
      case AppLaunchMode.landing:
        return 'landing';
    }
  }

  static AppLaunchMode fromAppLaunchMode(String name) {
    switch (name) {
      case 'onboard':
        return AppLaunchMode.onboard;
      case 'auth':
        return AppLaunchMode.auth;
      case 'landing':
        return AppLaunchMode.landing;
      default:
        return AppLaunchMode.onboard;
    }
  }
}
