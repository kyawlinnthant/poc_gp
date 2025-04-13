import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../bloc/confirm_pin_bloc.dart';
import 'confirm_pin_view.dart';

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
