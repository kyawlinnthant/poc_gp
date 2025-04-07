import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/domain/model/mobile_number.dart';
import 'package:poc/feature/feature/auth/presentation/otp_request/screen/otp_request_screen.dart';
import 'package:poc/feature/feature/auth/presentation/otp_verify/screen/verify_otp_screen.dart';
import 'package:poc/feature/feature/auth/presentation/pin/create/create_pin_view.dart';

import '../../data/store/app_data/app_data_store.dart';
import '../../data/store/app_data/app_launch_mode.dart';
import '../../feature/feature/auth/presentation/forgot_password/forgot_password_screen.dart';
import '../../feature/feature/auth/presentation/login/screen/login_screen.dart';
import '../../feature/feature/auth/presentation/pin/confirm/confirm_pin_view.dart';
import '../../feature/feature/auth/presentation/privacy_terms/privacy_terms_screen.dart';
import '../../feature/feature/auth/presentation/signup/screen/signup_screen.dart';
import '../../feature/feature/landing/landing_screen.dart';
import '../../feature/feature/onboard/onboard_screen.dart';
import '../di/di.dart';

final GoRouter appNavigator = GoRouter(
  initialLocation: Routes.login,
  routes: [
    // ONBOARD
    GoRoute(path: Routes.onboard, builder: (context, state) => OnBoardScreen()),
    // AUTH
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: Routes.otpRequest,
      builder: (context, state) => RequestOtpScreen(),
    ),
    GoRoute(
      path: Routes.otpVerify,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return VerifyOtpScreen(mobileNumber: phone);
      },
    ),

    GoRoute(
      path: Routes.register,
      builder: (context, state) {
        final phone = state.extra as MobileNumber;
        return SignupScreen(mobileNumber: phone);
      },
    ),
    GoRoute(
      path: Routes.createPin,
      builder: (context, state) => CreatePinView(),
    ),
    GoRoute(
      path: Routes.confirmPin,
      builder: (context, state) => ConfirmPinView(),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => PrivacyTermsScreen(),
    ),
    // Home Flow
    GoRoute(path: Routes.landing, builder: (context, state) => LandingScreen()),
  ],

  redirect: (context, state) async {
    final store = getIt.get<AppDataStore>();
    final launchMode = await store.loadAppLaunchMode();
    final mainRoutes = [
      Routes.onboard,
      Routes.login,
      Routes.createPin,
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
    if (launchMode == AppLaunchMode.landing &&
        mainRoutes.contains(state.matchedLocation)) {
      return Routes.landing;
    }

    return null;
  },
);
