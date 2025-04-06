part of 'request_otp_bloc.dart';

@immutable
class RequestOtpState extends Equatable {
  final String prefix;
  final String phone;
  final String phoneError;
  final UiState uiState;

  const RequestOtpState({
    this.prefix = '60',
    this.phone = '',
    this.phoneError = '',
    this.uiState = const UiIdle(),
  });

  RequestOtpState copyWith({
    String? prefix,
    String? phone,
    String? phoneError,
    UiState? uiState,
  }) {
    return RequestOtpState(
      prefix: prefix ?? this.prefix,
      phone: phone ?? this.phone,
      phoneError: phoneError ?? this.phoneError,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object?> get props => [prefix, phone, phoneError, uiState];
}
