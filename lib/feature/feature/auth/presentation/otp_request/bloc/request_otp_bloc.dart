import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc/feature/ui/state/ui_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../core/util/form_validator.dart';
import '../../../../../../data/network/resource/network_resource.dart';
import '../../../domain/repository/auth_repository.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  final AuthRepository repository;

  RequestOtpBloc({required this.repository}) : super(RequestOtpState()) {
    on<RequestOtpEvent>((event, emit) async {
      switch (event) {
        case OnRequestOtpPressed():
          await _requestOtp(emit);
        case OnUpdatePhone():
          emit(state.copyWith(phone: event.phone, phoneError: ''));
      }
    });
  }

  bool _validate({
    required Emitter<RequestOtpState> emit,
    required String phone,
  }) {
    String? phoneError = FormValidator.validateMobileNumber(phone.trim());

    emit(state.copyWith(phoneError: phoneError));

    return phoneError == null;
  }

  Future<void> _requestOtp(Emitter<RequestOtpState> emit) async {
    if (_validate(emit: emit, phone: state.phone)) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.requestOtp(
        phone: "${state.prefix.trim()}${state.phone.trim()}",
        authId: "a3BsLTNyZC1wYXJ0eS1hcGk6MXFhelpBUSE=",
        // Uuid().v4(),
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
