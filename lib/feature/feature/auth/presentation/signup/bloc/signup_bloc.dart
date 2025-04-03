import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/util/form_validator.dart';
import '../../../../../../data/network/resource/network_resource.dart';
import '../../../../../ui/state/ui_state.dart';
import '../../../data/dto/login_dto.dart';
import '../../../domain/repository/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository repository;

  SignupBloc({required this.repository}) : super(SignupState()) {
    on<SignupEvent>((event, emit) async {
      switch (event) {
        case OnSignupPressed():
          await _signup(emit);
        case OnUpdateEmail():
          emit(state.copyWith(email: event.email, emailError: ''));
        case OnUpdatePhone():
          emit(state.copyWith(phone: event.phone, phoneError: ''));
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
    required Emitter<SignupState> emit,
    required String phone,
    required String password,
  }) {
    String? phoneError = FormValidator.validateMobileNumber(phone.trim());
    String? passwordError = FormValidator.validatePassword(password.trim());

    emit(state.copyWith(phoneError: phoneError, passwordError: passwordError));

    return phoneError == null && passwordError == null;
  }

  Future<void> _signup(Emitter<SignupState> emit) async {
    if (_validate(emit: emit, phone: state.phone, password: state.password)) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.login(
        phone: state.phone,
        password: state.password,
      );
      switch (response) {
        case NetworkSuccess<LoginDto>():
          if (response.data != null) {
            emit(state.copyWith(uiState: UiSuccess()));
          }
        case NetworkFailed<LoginDto>():
          emit(state.copyWith(uiState: UiError(response.message)));
      }
    }
  }
}
