import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc/data/network/resource/network_resource.dart';

import '../../../../../../ui/state/ui_state.dart';
import '../../../../domain/repository/auth_repository.dart';

part 'confirm_pin_event.dart';
part 'confirm_pin_state.dart';

class ConfirmPinBloc extends Bloc<ConfirmPinEvent, ConfirmPinState> {
  final AuthRepository repository;

  ConfirmPinBloc({required this.repository}) : super(ConfirmPinState()) {
    on<ConfirmPinEvent>((event, emit) async {
      switch (event) {
        case OnUpdateConfirmPin():
          emit(state.copyWith(confirmPin: event.pin));
          if (event.pin.length == 6) {
            await _fetchCreatePin(emit);
          }
        case OnFetchCreatePin():
          await _fetchCreatePin(emit);
        case OnSetPin():
          emit(state.copyWith(pin: event.pin));
      }
    });
  }

  Future<void> _fetchCreatePin(Emitter<ConfirmPinState> emit) async {
    emit(state.copyWith(uiState: UiLoading()));
    final response = await repository.createPin(pin: state.pin);
    switch (response) {
      case NetworkSuccess<bool>():
        emit(state.copyWith(uiState: UiSuccess()));
      case NetworkFailed<bool>():
        emit(state.copyWith(uiState: UiError(response.message)));
    }
  }
}
