import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/pin/confirm/bloc/confirm_pin_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/pin/confirm/screen/confirm_pin_view.dart';
import 'package:poc/feature/feature/auth/presentation/pin/create/screen/create_pin_view.dart';

import '../../../../../../../core/di/di.dart';

class ConfirmPinScreen extends StatelessWidget {
  final String pin;

  const ConfirmPinScreen({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ConfirmPinBloc>()..add(OnSetPin(pin)),
      child: const ConfirmPinView(),
    );
  }
}
