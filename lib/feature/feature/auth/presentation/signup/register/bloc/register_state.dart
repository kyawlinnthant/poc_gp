part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {
  final String email;
  final MobileNumber mobileNumber;
  final String password;
  final String confirmPassword;
  final String emailError;
  final String passwordError;
  final String confirmPasswordError;
  final UiState uiState;

  final bool alreadyRegistered;

  const RegisterState({
    this.email = '',
    this.mobileNumber = const MobileNumber(prefix: '', phoneNumber: ''),
    this.password = '',
    this.confirmPassword = '',
    this.emailError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
    this.uiState = const UiIdle(),
    this.alreadyRegistered = false,
  });

  RegisterState copyWith({
    String? email,
    MobileNumber? mobileNumber,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    UiState? uiState,
    bool? alreadyRegistered,
  }) {
    return RegisterState(
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      uiState: uiState ?? this.uiState,
      alreadyRegistered: alreadyRegistered ?? this.alreadyRegistered,
    );
  }

  @override
  List<Object?> get props => [
    email,
    mobileNumber,
    password,
    confirmPassword,
    emailError,
    passwordError,
    confirmPasswordError,
    uiState,
    alreadyRegistered,
  ];
}
