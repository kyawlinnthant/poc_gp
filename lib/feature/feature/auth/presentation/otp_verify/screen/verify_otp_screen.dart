import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/domain/model/mobile_number.dart';
import 'package:poc/feature/feature/auth/presentation/otp_verify/bloc/verify_otp_bloc.dart';
import 'package:poc/feature/feature/auth/presentation/otp_verify/screen/verify_otp_view.dart';

import '../../../../../../core/di/di.dart';

class VerifyOtpScreen extends StatelessWidget {
  final MobileNumber mobileNumber;

  const VerifyOtpScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<VerifyOtpBloc>()
                ..add(OnSetPhoneVerifyOtp(mobileNumber: mobileNumber)),
      child: const VerifyOtpView(),
    );
  }
}
