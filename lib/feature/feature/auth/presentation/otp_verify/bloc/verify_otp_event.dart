part of 'verify_otp_bloc.dart';

@immutable
sealed class VerifyOtpEvent {}

final class OnSetPhoneVerifyOtp extends VerifyOtpEvent {
  final MobileNumber mobileNumber;

  OnSetPhoneVerifyOtp({required this.mobileNumber});
}

final class OnRequestVerifyOtp extends VerifyOtpEvent {
  final String otp;

  OnRequestVerifyOtp({required this.otp});
}

final class OnUpdateOtpVerifyOtp extends VerifyOtpEvent {
  final String otp;

  OnUpdateOtpVerifyOtp({required this.otp});
}

final class OnResendVerifyOtp extends VerifyOtpEvent {}
