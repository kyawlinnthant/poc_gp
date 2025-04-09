part of 'create_pin_bloc.dart';

@immutable
class CreatePinState extends Equatable {
  final String pin;
  final UiState uiState;

  const CreatePinState({this.uiState = const UiIdle(), this.pin = ''});

  CreatePinState copyWith({String? pin, UiState? uiState}) {
    return CreatePinState(
      pin: pin ?? this.pin,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [pin, uiState];
}
