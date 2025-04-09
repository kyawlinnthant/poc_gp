class Routes {
  // onboard
  static const String onboard = '/onboard';

  // auth
  static const String login = '/login';
  static const String otpRequest = '/otpRequest';
  static const String otpVerify = '/otpVerify/:${RouteParams.mobile}';
  static const String register = '/register/:${RouteParams.mobile}';
  static const String createPin = '/createPin';
  static const String confirmPin = '/confirmPin/:${RouteParams.oldPin}';
  static const String forgotPassword = '/forgotPassword';
  static const String helpCenter = '/help';

  // landing
  static const String landing = '/';
}

class RouteParams {
  static const String mobile = "mobile";
  static const String oldPin = "oldPin";
}
