part of 'create_pin_bloc.dart';

@immutable
sealed class CreatePinEvent {}

final class OnUpdatePin extends CreatePinEvent {
  final String pin;

  OnUpdatePin(this.pin);
}

final class OnCompleteCreatePin extends CreatePinEvent {}

final class OnResetCreatePin extends CreatePinEvent {}

final class OnResetUiStateCreatePin extends CreatePinEvent {}
