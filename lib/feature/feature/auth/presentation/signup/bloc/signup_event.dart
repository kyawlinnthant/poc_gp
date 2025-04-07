part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class OnSetMobile extends SignupEvent {
  final MobileNumber mobileNumber;

  OnSetMobile(this.mobileNumber);
}

final class OnSignupPressed extends SignupEvent {}

final class OnSignupInit extends SignupEvent {}

final class OnUpdateEmail extends SignupEvent {
  final String email;

  OnUpdateEmail(this.email);
}

final class OnUpdatePassword extends SignupEvent {
  final String password;

  OnUpdatePassword(this.password);
}

final class OnUpdateConfirmPassword extends SignupEvent {
  final String confirmPassword;

  OnUpdateConfirmPassword(this.confirmPassword);
}
