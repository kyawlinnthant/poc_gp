import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/util/form_validator.dart';
import '../../../../../../../data/network/resource/network_resource.dart';
import '../../../../../../../domain/model/mobile_number.dart';
import '../../../../../../ui/state/ui_state.dart';
import '../../../../domain/repository/auth_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository repository;

  ResetPasswordBloc({required this.repository}) : super(ResetPasswordState()) {
    on<ResetPasswordEvent>((event, emit) async {
      switch (event) {
        case OnSetMobile():
          emit(state.copyWith(mobileNumber: event.mobileNumber));
        case OnPwdPressed():
          await _reset(emit);
        case OnUpdatePassword():
          emit(state.copyWith(password: event.password, passwordError: ''));
        case OnUpdateConfirmPassword():
          emit(
            state.copyWith(
              confirmPassword: event.confirmPassword,
              confirmPasswordError: '',
            ),
          );
      }
    });
  }

  bool _validate({
    required Emitter<ResetPasswordState> emit,
    required String password,
    required String confirmPassword,
  }) {
    String? passwordError = FormValidator.validatePassword(password.trim());
    String? confirmPasswordError = FormValidator.validateConfirmPassword(
      password: password.trim(),
      confirmPassword: confirmPassword.trim(),
    );

    emit(
      state.copyWith(
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      ),
    );

    return passwordError == null && confirmPasswordError == null;
  }

  Future<void> _reset(Emitter<ResetPasswordState> emit) async {
    if (_validate(
      emit: emit,
      password: state.password,
      confirmPassword: state.confirmPassword,
    )) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.resetPassword(
        phone: state.mobileNumber.phoneNumber,
        password: state.password,
        prefix: state.mobileNumber.prefix,
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
