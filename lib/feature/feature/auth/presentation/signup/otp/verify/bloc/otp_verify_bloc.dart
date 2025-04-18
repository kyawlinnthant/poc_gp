import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../data/network/resource/network_resource.dart';
import '../../../../../../../ui/state/ui_state.dart';
import '../../../../../../common/otp_verify/verify_otp_event.dart';
import '../../../../../../common/otp_verify/verify_otp_state.dart';
import '../../../../../domain/repository/auth_repository.dart';

class OtpVerifySignupBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository repository;

  OtpVerifySignupBloc({required this.repository}) : super(VerifyOtpState()) {
    on<VerifyOtpEvent>((event, emit) async {
      switch (event) {
        case OnSetPhoneVerifyOtp():
          emit(state.copyWith(mobileNumber: event.mobileNumber));
        case OnRequestVerifyOtp():
          await _verifyOtp(emit: emit, otp: event.otp);
        case OnResendVerifyOtp():
          await _resentOtp(emit: emit);
        case OnUpdateOtpVerifyOtp():
          emit(state.copyWith(otpCode: event.otp));
        case OnResetVerifyOtp():
          emit(
            state.copyWith(
              otpCode: '',
              otpCodeError: '',
              verifyState: UiIdle(),
              resendState: UiIdle(),
            ),
          );
      }
    });
  }

  Future<void> _verifyOtp({
    required Emitter<VerifyOtpState> emit,
    required String otp,
  }) async {
    emit(state.copyWith(verifyState: UiLoading(), resendState: UiIdle()));
    final response = await repository.verifyOtpSignup(
      prefix: state.mobileNumber.prefix.trim(),
      phone: state.mobileNumber.phoneNumber.trim(),
      type: 2, // todo : ask this type ( make with enum )
      otp: otp.trim(),
    );
    switch (response) {
      case NetworkSuccess<bool>():
        if (response.data != null) {
          emit(state.copyWith(verifyState: UiSuccess()));
        }
      case NetworkFailed<bool>():
        emit(state.copyWith(verifyState: UiError(response.message)));
    }
  }

  Future<void> _resentOtp({required Emitter<VerifyOtpState> emit}) async {
    emit(state.copyWith(resendState: UiLoading(), verifyState: UiIdle()));

    final response = await repository.requestOtpSignup(
      prefix: state.mobileNumber.prefix.trim(),
      phone: state.mobileNumber.phoneNumber.trim(),
      type: '4', // todo : ask this type ( make enum )
    );
    switch (response) {
      case NetworkSuccess<bool>():
        if (response.data != null) {
          emit(state.copyWith(resendState: UiError('otpSent'.tr())));
          emit(state.copyWith(resendState: UiSuccess()));
        }
      case NetworkFailed<bool>():
        emit(state.copyWith(resendState: UiError(response.message)));
    }
  }
}
