import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../data/network/resource/network_resource.dart';
import '../../../../../../../ui/state/ui_state.dart';
import '../../../../../../common/otp_verify/verify_otp_event.dart';
import '../../../../../../common/otp_verify/verify_otp_state.dart';
import '../../../../../domain/repository/auth_repository.dart';

class OtpVerifyPasswordBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository repository;

  OtpVerifyPasswordBloc({required this.repository}) : super(VerifyOtpState()) {
    on<VerifyOtpEvent>((event, emit) async {
      switch (event) {
        case OnSetPhoneVerifyOtp():
          emit(state.copyWith(mobileNumber: event.mobileNumber));
        case OnRequestVerifyOtp():
          await _verifyOtp(emit: emit, opt: event.otp);
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
    required String opt,
  }) async {
    emit(state.copyWith(verifyState: UiLoading(), resendState: UiIdle()));
    final response = await repository.verifyOtpPassword(
      phone: "${state.mobileNumber.prefix}${state.mobileNumber.phoneNumber}",
      otp: opt,
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
    final response = await repository.resentOtpSignup(
      phone: "${state.mobileNumber.prefix}${state.mobileNumber.phoneNumber}",
      authId: "a3BsLTNyZC1wYXJ0eS1hcGk6MXFhelpBUSE=",
    );
    switch (response) {
      case NetworkSuccess<bool>():
        if (response.data != null) {
          emit(state.copyWith(resendState: UiSuccess()));
        }
      case NetworkFailed<bool>():
        emit(state.copyWith(resendState: UiError(response.message)));
    }
  }
}
