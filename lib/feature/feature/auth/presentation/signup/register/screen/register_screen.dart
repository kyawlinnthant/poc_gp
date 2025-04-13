import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/signup/register/screen/register_view.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../domain/model/mobile_number.dart';
import '../bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final MobileNumber mobileNumber;

  const RegisterScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<RegisterBloc>()..add(OnSetMobile(mobileNumber)),
      child: const RegisterView(),
    );
  }
}
