import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc/domain/model/mobile_number.dart';

import '../../../../../../../core/util/form_validator.dart';
import '../../../../../../../data/network/resource/network_resource.dart';
import '../../../../../../ui/state/ui_state.dart';
import '../../../../domain/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;

  RegisterBloc({required this.repository}) : super(RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      switch (event) {
        case OnSignupPressed():
          await _signup(emit);
        case OnUpdateEmail():
          emit(state.copyWith(email: event.email, emailError: ''));
        case OnUpdatePassword():
          emit(state.copyWith(password: event.password, passwordError: ''));
        case OnUpdateConfirmPassword():
          emit(
            state.copyWith(
              confirmPassword: event.confirmPassword,
              confirmPasswordError: '',
            ),
          );
        case OnSetMobile():
          emit(state.copyWith(mobileNumber: event.mobileNumber));
      }
    });
  }

  bool _validate({
    required Emitter<RegisterState> emit,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    String? emailError = FormValidator.validateEmail(email.trim());
    String? passwordError = FormValidator.validatePassword(password.trim());
    String? confirmPasswordError = FormValidator.validateConfirmPassword(
      password: password.trim(),
      confirmPassword: confirmPassword.trim(),
    );

    emit(
      state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      ),
    );

    return emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

  Future<void> _signup(Emitter<RegisterState> emit) async {
    if (state.alreadyRegistered) {
      emit(state.copyWith(uiState: UiSuccess()));
      return;
    }
    if (_validate(
      emit: emit,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
    )) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.register(
        phone: state.mobileNumber.phoneNumber,
        password: state.password,
        prefix: state.mobileNumber.prefix,
        email: state.email,
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
