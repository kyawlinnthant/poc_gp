part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class OnLoginPressed extends LoginEvent {}

final class OnUpdatePhone extends LoginEvent {
  final String phone;

  OnUpdatePhone(this.phone);
}

final class OnUpdatePassword extends LoginEvent {
  final String password;

  OnUpdatePassword(this.password);
}
