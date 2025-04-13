part of 'reset_password_bloc.dart';

@immutable
class ResetPasswordState extends Equatable {
  final MobileNumber mobileNumber;
  final String password;
  final String confirmPassword;
  final String emailError;
  final String passwordError;
  final String confirmPasswordError;
  final UiState uiState;

  const ResetPasswordState({
    this.mobileNumber = const MobileNumber(prefix: '', phoneNumber: ''),
    this.password = '',
    this.confirmPassword = '',
    this.emailError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
    this.uiState = const UiIdle(),
  });

  ResetPasswordState copyWith({
    MobileNumber? mobileNumber,
    String? password,
    String? confirmPassword,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    UiState? uiState,
  }) {
    return ResetPasswordState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [
    mobileNumber,
    password,
    confirmPassword,
    emailError,
    passwordError,
    confirmPasswordError,
    uiState,
  ];
}
