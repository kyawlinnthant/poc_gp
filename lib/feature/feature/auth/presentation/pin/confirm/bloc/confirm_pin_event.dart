part of 'confirm_pin_bloc.dart';

@immutable
sealed class ConfirmPinEvent {}

final class OnSetPin extends ConfirmPinEvent {
  final String pin;

  OnSetPin(this.pin);
}

final class OnUpdateConfirmPin extends ConfirmPinEvent {
  final String pin;

  OnUpdateConfirmPin(this.pin);
}

final class OnFetchCreatePin extends ConfirmPinEvent {}

final class OnResetUiStateConfirmPin extends ConfirmPinEvent {}
