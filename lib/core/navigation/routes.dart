class Routes {
  // onboard
  static const String onboard = '/onboard';

  // auth
  static const String login = '/login';
  static const String otpRequest = '/otpRequest';
  static const String otpVerify = '/otpVerify/:${RouteParams.phone}';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String helpCenter = '/help';

  // landing
  static const String landing = '/';
}

class RouteParams {
  static const String phone = "phone";
}
