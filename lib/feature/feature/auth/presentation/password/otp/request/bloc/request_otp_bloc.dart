import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/util/form_validator.dart';
import '../../../../../../../../data/network/resource/network_resource.dart';
import '../../../../../../../ui/state/ui_state.dart';
import '../../../../../../common/otp_request/request_otp_event.dart';
import '../../../../../../common/otp_request/request_otp_state.dart';
import '../../../../../domain/repository/auth_repository.dart';

class OtpRequestPasswordBloc extends Bloc<OtpRequestEvent, OtpRequestState> {
  final AuthRepository repository;

  OtpRequestPasswordBloc({required this.repository})
    : super(OtpRequestState()) {
    on<OtpRequestEvent>((event, emit) async {
      switch (event) {
        case OnRequestOtpPressed():
          await _requestOtp(emit);
        case OnUpdatePhone():
          emit(state.copyWith(phone: event.phone, phoneError: ''));
        case OnRequestOtpReset():
          emit(state.copyWith(uiState: UiIdle()));
      }
    });
  }

  bool _validate({
    required Emitter<OtpRequestState> emit,
    required String phone,
  }) {
    String? phoneError = FormValidator.validateMobileNumber(phone.trim());

    emit(state.copyWith(phoneError: phoneError));

    return phoneError == null;
  }

  Future<void> _requestOtp(Emitter<OtpRequestState> emit) async {
    if (_validate(emit: emit, phone: state.phone)) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.requestOtpPassword(
        prefix: state.prefix.trim(),
        phone: state.phone.trim(),
        type: '4', // todo : ask this type ( make enum )
      );
      switch (response) {
        case NetworkSuccess<bool>():
          if (response.data != null) {
            emit(state.copyWith(uiState: UiSuccess()));
          }
        case NetworkFailed<bool>():
          emit(state.copyWith(uiState: UiError(response.message)));
      }
    }
  }
}
