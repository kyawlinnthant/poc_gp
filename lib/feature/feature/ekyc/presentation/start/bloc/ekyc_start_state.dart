part of 'ekyc_start_bloc.dart';

@immutable
class EkycStartState extends Equatable {
  final bool hasData;
  final UiState uiState;

  const EkycStartState({this.uiState = const UiIdle(), this.hasData = false});

  EkycStartState copyWith({bool? hasData, UiState? uiState}) {
    return EkycStartState(
      hasData: hasData ?? this.hasData,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [hasData, uiState];
}
