import 'package:flutter/material.dart';

@immutable
sealed class OtpRequestEvent {}

final class OnRequestOtpPressed extends OtpRequestEvent {}

final class OnRequestOtpReset extends OtpRequestEvent {}

final class OnUpdatePhone extends OtpRequestEvent {
  final String phone;

  OnUpdatePhone(this.phone);
}
