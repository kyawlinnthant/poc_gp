part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class OnSetMobile extends RegisterEvent {
  final MobileNumber mobileNumber;

  OnSetMobile(this.mobileNumber);
}

final class OnSignupPressed extends RegisterEvent {}

final class OnUpdateEmail extends RegisterEvent {
  final String email;

  OnUpdateEmail(this.email);
}

final class OnUpdatePassword extends RegisterEvent {
  final String password;

  OnUpdatePassword(this.password);
}

final class OnUpdateConfirmPassword extends RegisterEvent {
  final String confirmPassword;

  OnUpdateConfirmPassword(this.confirmPassword);
}
