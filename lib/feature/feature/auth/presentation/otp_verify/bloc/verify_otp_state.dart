part of 'verify_otp_bloc.dart';

@immutable
class VerifyOtpState extends Equatable {
  final String phone;
  final String otpCode;
  final String otpCodeError;
  final UiState verifyState;
  final UiState resendState;
  final TextEditingController controller;

  VerifyOtpState({
    this.phone = '',
    this.otpCode = '',
    this.otpCodeError = '',
    this.verifyState = const UiIdle(),
    this.resendState = const UiIdle(),
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();

  VerifyOtpState copyWith({
    String? phone,
    String? otpCode,
    String? otpCodeError,
    UiState? verifyState,
    UiState? resendState,
    TextEditingController? controller,
  }) {
    return VerifyOtpState(
      phone: phone ?? this.phone,
      otpCode: otpCode ?? this.otpCode,
      otpCodeError: otpCodeError ?? this.otpCodeError,
      verifyState: verifyState ?? this.verifyState,
      resendState: resendState ?? this.resendState,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [
    phone,
    otpCode,
    otpCodeError,
    verifyState,
    resendState,
    controller,
  ];
}
