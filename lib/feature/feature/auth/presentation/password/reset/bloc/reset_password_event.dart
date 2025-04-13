part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class OnSetMobile extends ResetPasswordEvent {
  final MobileNumber mobileNumber;

  OnSetMobile(this.mobileNumber);
}

final class OnPwdPressed extends ResetPasswordEvent {}

final class OnUpdatePassword extends ResetPasswordEvent {
  final String password;

  OnUpdatePassword(this.password);
}

final class OnUpdateConfirmPassword extends ResetPasswordEvent {
  final String confirmPassword;

  OnUpdateConfirmPassword(this.confirmPassword);
}
