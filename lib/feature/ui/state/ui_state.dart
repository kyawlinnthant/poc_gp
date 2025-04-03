import 'package:equatable/equatable.dart';

sealed class UiState extends Equatable {
  const UiState();

  @override
  List<Object?> get props => [];
}

final class UiIdle extends UiState {
  const UiIdle();
}

final class UiLoading extends UiState {}

final class UiError extends UiState {
  final String message;

  const UiError(this.message);
}

final class UiSuccess extends UiState {}
