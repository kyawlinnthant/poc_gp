part of 'confirm_pin_bloc.dart';

@immutable
class ConfirmPinState extends Equatable {
  final String pin;
  final String confirmPin;
  final UiState uiState;

  const ConfirmPinState({
    this.uiState = const UiIdle(),
    this.pin = '',
    this.confirmPin = '',
  });

  ConfirmPinState copyWith({
    String? pin,
    String? confirmPin,
    UiState? uiState,
  }) {
    return ConfirmPinState(
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [pin, confirmPin, uiState];
}
