import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/di/di.dart';
import '../bloc/request_otp_bloc.dart';
import 'otp_request_password_view.dart';

class OtpRequestPasswordScreen extends StatelessWidget {
  const OtpRequestPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpRequestPasswordBloc>(),
      child: const OtpRequestPasswordView(),
    );
  }
}
