import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/feature/feature/common/otp_verify_view.dart';

import '../../../../../../../../core/navigation/routes.dart';
import '../../../../../../../../domain/model/mobile_number.dart';
import '../../../../../../../ui/prompt/snackbar.dart';
import '../../../../../../../ui/state/ui_state.dart';
import '../../../../../../common/otp_resend/resend_cubit.dart';
import '../../../../../../common/otp_verify/verify_otp_event.dart';
import '../../../../../../common/otp_verify/verify_otp_state.dart';
import '../bloc/otp_verify_bloc.dart';

class OtpVerifyPasswordView extends StatelessWidget {
  const OtpVerifyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerifyPasswordBloc, VerifyOtpState>(
      listenWhen: (previous, current) {
        return previous.verifyState != current.verifyState ||
            previous.resendState != current.resendState;
      },
      listener: (context, state) {
        if (state.verifyState is UiError) {
          showSnackBar(
            context: context,
            message: (state.verifyState as UiError).message,
          );
        }
        if (state.verifyState is UiSuccess) {
          context.push(
            Routes.register,
            extra: MobileNumber(
              prefix: state.mobileNumber.prefix,
              phoneNumber: state.mobileNumber.phoneNumber,
            ),
          );
          context.read<OtpVerifyPasswordBloc>().add(OnResetVerifyOtp());
        }
        if (state.resendState is UiError) {
          showSnackBar(
            context: context,
            message: (state.resendState as UiError).message,
          );
        }
        if (state.resendState is UiSuccess) {
          state.controller.clear();
          context.read<CountdownCubit>().startCountdown();
        }
      },
      builder: (context, state) {
        return OtpVerifyView(
          isLoading:
              state.verifyState is UiLoading || state.resendState is UiLoading,
          appBarTitle: 'verifyNumber'.tr(),
          title: 'otpTitle'.tr(),
          description: 'otpDescription'.tr(),
          onPinChange: (String v) {
            context.read<OtpVerifyPasswordBloc>().add(
              OnUpdateOtpVerifyOtp(otp: v),
            );
          },
          onPinComplete: (String v) {
            context.read<OtpVerifyPasswordBloc>().add(
              OnRequestVerifyOtp(otp: v),
            );
          },
          controller: state.controller,
          onResent: () {
            context.read<OtpVerifyPasswordBloc>().add(OnResendVerifyOtp());
          },
        );
      },
    );
  }
}
