import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../ui/state/ui_state.dart';

@immutable
class OtpRequestState extends Equatable {
  final String prefix;
  final String phone;
  final String phoneError;
  final UiState uiState;

  const OtpRequestState({
    this.prefix = AppConstant.defaultPrefix,
    this.phone = '',
    this.phoneError = '',
    this.uiState = const UiIdle(),
  });

  OtpRequestState copyWith({
    String? prefix,
    String? phone,
    String? phoneError,
    UiState? uiState,
  }) {
    return OtpRequestState(
      prefix: prefix ?? this.prefix,
      phone: phone ?? this.phone,
      phoneError: phoneError ?? this.phoneError,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [prefix, phone, phoneError, uiState];
}
