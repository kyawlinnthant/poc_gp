part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final String phone;
  final String password;
  final String phoneError;
  final String passwordError;
  final UiState uiState;

  const LoginState({
    this.phone = '',
    this.password = '',
    this.phoneError = '',
    this.passwordError = '',
    this.uiState = const UiIdle(),
  });

  LoginState copyWith({
    String? phone,
    String? password,
    String? phoneError,
    String? passwordError,
    UiState? uiState,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      phoneError: phoneError ?? this.phoneError,
      passwordError: passwordError ?? this.passwordError,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [
    phone,
    password,
    phoneError,
    passwordError,
    uiState,
  ];
}
