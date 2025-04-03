part of 'signup_bloc.dart';

@immutable
class SignupState extends Equatable {
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String emailError;
  final String phoneError;
  final String passwordError;
  final String confirmPasswordError;
  final UiState uiState;

  const SignupState({
    this.email = '',
    this.phone = '',
    this.password = '',
    this.confirmPassword = '',
    this.emailError = '',
    this.phoneError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
    this.uiState = const UiIdle(),
  });

  SignupState copyWith({
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? phoneError,
    String? passwordError,
    String? confirmPasswordError,
    UiState? uiState,
  }) {
    return SignupState(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [
    email,
    phone,
    password,
    confirmPassword,
    emailError,
    phoneError,
    passwordError,
    confirmPasswordError,
    uiState,
  ];
}
