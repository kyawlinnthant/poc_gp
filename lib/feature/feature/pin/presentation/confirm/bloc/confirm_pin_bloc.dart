import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc/data/network/resource/network_resource.dart';
import 'package:poc/feature/feature/pin/domain/repostiory/pin_repository.dart';

import '../../../../../ui/state/ui_state.dart';

part 'confirm_pin_event.dart';
part 'confirm_pin_state.dart';

class ConfirmPinBloc extends Bloc<ConfirmPinEvent, ConfirmPinState> {
  final PinRepository repository;

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
        case OnResetUiStateConfirmPin():
          emit(state.copyWith(uiState: UiIdle()));
      }
    });
  }

  Future<void> _fetchCreatePin(Emitter<ConfirmPinState> emit) async {
    if (state.pin.trim() != state.confirmPin.trim()) {
      emit(state.copyWith(uiState: UiError('pinNotMatch'.tr())));
      return;
    }
    emit(state.copyWith(uiState: UiLoading()));
    final response = await repository.createPin(pin: state.pin);
    switch (response) {
      case NetworkSuccess<bool>():
        if (response.data != null) {
          emit(state.copyWith(uiState: UiSuccess()));
        }
      case NetworkFailed<bool>():
        emit(state.copyWith(uiState: UiError(response.message)));
    }
  }
}
