import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/domain/model/mobile_number.dart';

import '../../../../../../../../core/di/di.dart';
import '../../../../../../common/otp_verify/verify_otp_event.dart';
import '../bloc/otp_verify_bloc.dart';
import 'otp_verify_view.dart';

class OtpVerifySignupScreen extends StatelessWidget {
  final MobileNumber mobileNumber;

  const OtpVerifySignupScreen({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<OtpVerifySignupBloc>()
                ..add(OnSetPhoneVerifyOtp(mobileNumber: mobileNumber)),
      child: const OtpVerifySignupView(),
    );
  }
}
