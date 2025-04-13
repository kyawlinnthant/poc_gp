import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/password/reset/bloc/reset_password_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/password/reset/screen/reset_pwd_view.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../domain/model/mobile_number.dart';

class ResetPasswordScreen extends StatelessWidget {
  final MobileNumber mobileNumber;

  const ResetPasswordScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<ResetPasswordBloc>()..add(OnSetMobile(mobileNumber)),
      child: const ResetPasswordView(),
    );
  }
}
