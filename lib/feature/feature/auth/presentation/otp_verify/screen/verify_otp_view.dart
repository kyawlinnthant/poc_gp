import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/auth/presentation/otp_verify/bloc/verify_otp_bloc.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/theme/dimen.dart';
import '../../../../../../domain/model/mobile_number.dart';
import '../../../../../ui/component/pin_text_field.dart';
import '../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/state/ui_state.dart';
import '../../../../../ui/view/orientation.dart';
import '../resend/resend_cubit.dart';
import '../resend/resend_view.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
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
        return ModalLoaderPlaceholder(
          isLoading:
              state.verifyState is UiLoading || state.resendState is UiLoading,
          child: Scaffold(
            appBar: AppBar(title: Text('verifyNumber'.tr())),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: OrientationView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpacer(),
                          Text(
                            'otpTitle'.tr(),
                            style: context.textStyles.titleLarge,
                          ),
                          VerticalSpacer(),
                          Text(
                            'otpDescription'.tr(),
                            style: context.textStyles.labelMedium,
                          ),
                          VerticalSpacer(height: Dimens.paddingBase3x),
                          PinTextField(
                            onChanged: (String v) {
                              context.read<VerifyOtpBloc>().add(
                                OnUpdateOtpVerifyOtp(otp: v),
                              );
                            },
                            onCompleted: (String otp) {
                              context.read<VerifyOtpBloc>().add(
                                OnRequestVerifyOtp(otp: otp),
                              );
                            },
                            controller: state.controller,
                          ),
                          VerticalSpacer(),
                          ResentView(
                            onResend: () {
                              context.read<VerifyOtpBloc>().add(
                                OnResendVerifyOtp(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
