import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/mobile_number.dart';
import '../../../ui/state/ui_state.dart';

@immutable
class VerifyOtpState extends Equatable {
  final MobileNumber mobileNumber;
  final String otpCode;
  final String otpCodeError;
  final UiState verifyState;
  final UiState resendState;
  final TextEditingController controller;

  VerifyOtpState({
    this.mobileNumber = const MobileNumber(prefix: '', phoneNumber: ''),
    this.otpCode = '',
    this.otpCodeError = '',
    this.verifyState = const UiIdle(),
    this.resendState = const UiIdle(),
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();

  VerifyOtpState copyWith({
    MobileNumber? mobileNumber,
    String? otpCode,
    String? otpCodeError,
    UiState? verifyState,
    UiState? resendState,
    TextEditingController? controller,
  }) {
    return VerifyOtpState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      otpCode: otpCode ?? this.otpCode,
      otpCodeError: otpCodeError ?? this.otpCodeError,
      verifyState: verifyState ?? this.verifyState,
      resendState: resendState ?? this.resendState,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [
    mobileNumber,
    otpCode,
    otpCodeError,
    verifyState,
    resendState,
    controller,
  ];
}
