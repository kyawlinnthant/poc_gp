import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/screen/signup_view.dart';

import '../../../../../../core/di/di.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child: const SignupView(),
    );
  }
}
