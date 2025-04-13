import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:poc/feature/feature/pin/domain/repostiory/pin_repository.dart';

import '../../../../../ui/state/ui_state.dart';

part 'create_pin_event.dart';
part 'create_pin_state.dart';

class CreatePinBloc extends Bloc<CreatePinEvent, CreatePinState> {
  final PinRepository repository;

  CreatePinBloc({required this.repository}) : super(CreatePinState()) {
    on<CreatePinEvent>((event, emit) async {
      switch (event) {
        case OnUpdatePin():
          emit(state.copyWith(pin: event.pin));
          if (event.pin.trim().length == 6) {
            await _onNext(emit);
          }
        case OnCompleteCreatePin():
          await _onNext(emit);
        case OnResetCreatePin():
          emit(state.copyWith(pin: '', uiState: UiIdle()));
        case OnResetUiStateCreatePin():
          emit(state.copyWith(uiState: UiIdle()));
      }
    });
  }

  Future<void> _onNext(Emitter<CreatePinState> emit) async {
    emit(state.copyWith(uiState: UiSuccess()));
  }
}
