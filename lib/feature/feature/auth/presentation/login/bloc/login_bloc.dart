import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:poc/feature/ui/state/ui_state.dart';

import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/util/form_validator.dart';
import '../../../../../../data/network/resource/network_resource.dart';
import '../../../domain/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc({required this.repository}) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      switch (event) {
        case OnLoginPressed():
          await _login(emit);
        case OnUpdatePhone():
          emit(state.copyWith(phone: event.phone, phoneError: ''));
        case OnUpdatePassword():
          emit(state.copyWith(password: event.password, passwordError: ''));
      }
    });
  }

  bool _validate({
    required Emitter<LoginState> emit,
    required String phone,
    required String password,
  }) {
    String? phoneError = FormValidator.validateMobileNumber(phone.trim());
    String? passwordError = FormValidator.validatePassword(password.trim());

    emit(state.copyWith(phoneError: phoneError, passwordError: passwordError));

    return phoneError == null && passwordError == null;
  }

  Future<void> _login(Emitter<LoginState> emit) async {
    if (_validate(emit: emit, phone: state.phone, password: state.password)) {
      emit(state.copyWith(uiState: UiLoading()));
      final response = await repository.login(
        phone: state.phone.trim(),
        password: state.password,
        prefix: state.prefix.trim(),
        type: 2,
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
