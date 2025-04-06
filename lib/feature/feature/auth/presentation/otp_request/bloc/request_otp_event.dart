part of 'request_otp_bloc.dart';

@immutable
sealed class RequestOtpEvent {}

final class OnRequestOtpPressed extends RequestOtpEvent {}

final class OnUpdatePhone extends RequestOtpEvent {
  final String phone;

  OnUpdatePhone(this.phone);
}
