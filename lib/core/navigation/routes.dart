class Routes {
  // onboard
  static const String onboard = '/onboard';

  // auth - login
  static const String login = '/login';

  // auth - signup
  static const String signupOTPRequest = '/otpRequestSignup';
  static const String signupOTPVerify =
      '/otpVerifySignup/:${RouteParams.mobile}';
  static const String register = '/register/:${RouteParams.mobile}';
  static const String registerSuccess = '/registerSuccess';

  // auth - password
  static const String forgotPwdOTPRequest = '/otpRequestPwd';
  static const String forgotPwdOTPVerify =
      '/otpVerifyPwd/:${RouteParams.mobile}';
  static const String resetPwd = '/resetPwd/:${RouteParams.mobile}';
  static const String resetPwdSuccess = '/resetPwdSuccess';

  // auth - help
  static const String helpCenter = '/help';

  // pin
  static const String createPin = '/createPin';
  static const String confirmPin = '/confirmPin/:${RouteParams.oldPin}';
  static const String pinSuccess = '/pinSuccess';

  // e-kyc
  static const String eKycStart = '/eKycStart';
  static const String eKycFlow = '/eKycFlow';
  static const String eKycChooseType = '/eKycType';
  static const String eKycSelfieTake = '/eKycSelfieTake';
  static const String eKycSelfieConfirm = '/eKycSelfieConfirm';
  static const String ekycSuccess = '/ekycSuccess';

  // landing
  static const String landing = '/';
}

class RouteParams {
  static const String mobile = "mobile";
  static const String oldPin = "oldPin";
}
