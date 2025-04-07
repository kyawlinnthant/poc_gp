import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/screen/signup_view.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../domain/model/mobile_number.dart';

class SignupScreen extends StatelessWidget {
  final MobileNumber mobileNumber;

  const SignupScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>()..add(OnSetMobile(mobileNumber)),
      child: const SignupView(),
    );
  }
}
