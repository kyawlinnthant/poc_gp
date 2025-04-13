import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/domain/model/mobile_number.dart';
import 'package:poc/feature/feature/auth/presentation/password/otp/request/screen/otp_request_password_screen.dart';
import 'package:poc/feature/feature/auth/presentation/password/reset/screen/reset_pwd_screen.dart';
import 'package:poc/feature/feature/auth/presentation/password/success/password_success_screen.dart';
import 'package:poc/feature/feature/auth/presentation/signup/register/screen/register_screen.dart';
import 'package:poc/feature/feature/auth/presentation/signup/success/signup_success_screen.dart';

import '../../data/store/app_data/app_data_store.dart';
import '../../data/store/app_data/app_launch_mode.dart';
import '../../feature/feature/auth/presentation/login/screen/login_screen.dart';
import '../../feature/feature/auth/presentation/password/otp/verify/screen/otp_verify_password_screen.dart';
import '../../feature/feature/auth/presentation/privacy_terms/privacy_terms_screen.dart';
import '../../feature/feature/auth/presentation/signup/otp/request/screen/otp_request_signup_screen.dart';
import '../../feature/feature/auth/presentation/signup/otp/verify/screen/otp_verify_screen.dart';
import '../../feature/feature/landing/landing_screen.dart';
import '../../feature/feature/onboard/onboard_screen.dart';
import '../../feature/feature/pin/presentation/confirm/screen/confirm_pin_screen.dart';
import '../../feature/feature/pin/presentation/create/screen/create_pin_screen.dart';
import '../di/di.dart';

final GoRouter appNavigator = GoRouter(
  initialLocation: Routes.login,
  routes: [
    // ONBOARD
    GoRoute(path: Routes.onboard, builder: (context, state) => OnBoardScreen()),
    // AUTH
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => PrivacyTermsScreen(),
    ),
    // signup
    GoRoute(
      path: Routes.signupOTPRequest,
      builder: (context, state) => OtpRequestSignupScreen(),
    ),
    GoRoute(
      path: Routes.signupOTPVerify,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return OtpVerifySignupScreen(mobileNumber: phone);
      },
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return RegisterScreen(mobileNumber: phone);
      },
    ),
    GoRoute(
      path: Routes.registerSuccess,
      builder: (context, state) => SignupSuccessScreen(),
    ),
    // password
    GoRoute(
      path: Routes.forgotPwdOTPRequest,
      builder: (context, state) => OtpRequestPasswordScreen(),
    ),
    GoRoute(
      path: Routes.forgotPwdOTPVerify,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return OtpVerifyPasswordScreen(mobileNumber: phone);
      },
    ),
    GoRoute(
      path: Routes.resetPwd,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return ResetPasswordScreen(mobileNumber: phone);
      },
    ),
    GoRoute(
      path: Routes.resetPwdSuccess,
      builder: (context, state) => PasswordSuccessScreen(),
    ),
    // PIN
    GoRoute(
      path: Routes.createPin,
      builder: (context, state) => CreatePinScreen(),
    ),
    GoRoute(
      path: Routes.confirmPin,
      builder: (context, state) {
        final pin = state.extra as String;
        return ConfirmPinScreen(pin: pin);
      },
    ),
    // HOME
    GoRoute(path: Routes.landing, builder: (context, state) => LandingScreen()),
  ],

  redirect: (context, state) async {
    final store = getIt.get<AppDataStore>();
    final launchMode = await store.loadAppLaunchMode();
    final mainRoutes = [
      Routes.onboard,
      Routes.login,
      Routes.createPin,
      Routes.eKycIntro,
      Routes.landing,
    ];

    if (launchMode == AppLaunchMode.onboard &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.onboard;
    }
    if (launchMode == AppLaunchMode.login &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.login;
    }
    if (launchMode == AppLaunchMode.createPin &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.createPin;
    }
    if (launchMode == AppLaunchMode.eKyc &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.eKycIntro;
    }
    if (launchMode == AppLaunchMode.landing &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.landing;
    }

    return null;
  },
);
