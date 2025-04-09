import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/pin/create/bloc/create_pin_bloc.dart';

import '../../../../../../../core/di/di.dart';
import 'create_pin_view.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreatePinBloc>(),
      child: const CreatePinView(),
    );
  }
}
