import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../ui/state/ui_state.dart';
import '../../../domain/repository/ekyc_repository.dart';

part 'ekyc_start_event.dart';
part 'ekyc_start_state.dart';

class EkycStartBloc extends Bloc<EkycStartEvent, EkycStartState> {
  final EkycRepository repository;

  EkycStartBloc({required this.repository}) : super(EkycStartState()) {
    on<EkycStartEvent>((event, emit) async {
      switch (event) {
        case OnGetEkycStatus():
          await _setStatus(emit);
        case OnResetToLogin():
          await _reset(emit);
      }
    });
  }

  Future<void> _reset(Emitter<EkycStartState> emit) async {
    emit(state.copyWith(uiState: UiLoading()));
    await Future.delayed(Duration(seconds: 1));
    final hasDone = await repository.resetAuthFlow();
    if (hasDone) {
      emit(state.copyWith(uiState: UiSuccess()));
    } else {
      emit(state.copyWith(uiState: UiError('')));
    }
  }

  Future<void> _setStatus(Emitter<EkycStartState> emit) async {
    final inEkyc = await repository.eKycInAuth();
    emit(state.copyWith(hasData: inEkyc));
  }
}
