import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/di/di.dart';
import '../bloc/request_otp_bloc.dart';
import 'otp_request_signup_view.dart';

class OtpRequestSignupScreen extends StatelessWidget {
  const OtpRequestSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpRequestSignupBloc>(),
      child: const OtpRequestSignupView(),
    );
  }
}
