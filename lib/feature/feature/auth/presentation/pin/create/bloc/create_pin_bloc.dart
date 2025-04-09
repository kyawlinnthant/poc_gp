import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../ui/state/ui_state.dart';
import '../../../../domain/repository/auth_repository.dart';

part 'create_pin_event.dart';
part 'create_pin_state.dart';

class CreatePinBloc extends Bloc<CreatePinEvent, CreatePinState> {
  final AuthRepository repository;

  CreatePinBloc({required this.repository}) : super(CreatePinState()) {
    on<CreatePinEvent>((event, emit) async {
      switch (event) {
        case OnUpdatePin():
          emit(state.copyWith(pin: event.pin));
          if (event.pin.length == 6) {
            await _onNext(emit);
          }
        case OnCompleteCreatePin():
          await _onNext(emit);
      }
    });
  }

  Future<void> _onNext(Emitter<CreatePinState> emit) async {
    emit(state.copyWith(uiState: UiSuccess()));
  }
}
