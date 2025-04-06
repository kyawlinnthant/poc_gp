import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/otp_request/bloc/request_otp_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/otp_request/screen/otp_request_view.dart';

import '../../../../../../core/di/di.dart';

class RequestOtpScreen extends StatelessWidget {
  const RequestOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RequestOtpBloc>(),
      child: const RequestOtpView(),
    );
  }
}
