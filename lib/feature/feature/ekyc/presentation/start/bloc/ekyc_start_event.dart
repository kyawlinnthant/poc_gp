part of 'ekyc_start_bloc.dart';

@immutable
sealed class EkycStartEvent {}

final class OnGetEkycStatus extends EkycStartEvent {}

final class OnResetToLogin extends EkycStartEvent {}
