import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/domain/model/mobile_number.dart';
import 'package:poc/feature/feature/common/otp_request_view.dart';

import '../../../../../../../../core/navigation/routes.dart';
import '../../../../../../../ui/prompt/snackbar.dart';
import '../../../../../../../ui/state/ui_state.dart';
import '../../../../../../common/otp_request/request_otp_event.dart';
import '../../../../../../common/otp_request/request_otp_state.dart';
import '../bloc/request_otp_bloc.dart';

class OtpRequestPasswordView extends StatelessWidget {
  const OtpRequestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpRequestPasswordBloc, OtpRequestState>(
      listenWhen: (previous, current) {
        return previous.uiState != current.uiState;
      },
      listener: (context, state) {
        if (state.uiState is UiError) {
          showSnackBar(
            context: context,
            message: (state.uiState as UiError).message,
          );
        }
        if (state.uiState is UiSuccess) {
          context.push(
            Routes.forgotPwdOTPVerify,
            extra: MobileNumber(prefix: state.prefix, phoneNumber: state.phone),
          );
          context.read<OtpRequestPasswordBloc>().add(OnRequestOtpReset());
        }
      },
      builder: (context, state) {
        return OtpRequestView(
          isLoading: state.uiState is UiLoading,
          title: 'pwdRequestTitle'.tr(),
          description: 'pwdRequestDescription'.tr(),
          onPhoneNumberChange: (String v) {
            context.read<OtpRequestPasswordBloc>().add(OnUpdatePhone(v));
          },
          prefix: state.prefix,
          phoneError: state.phoneError,
          onPrefixClick: () {},
          onActionClick: () {
            context.read<OtpRequestPasswordBloc>().add(OnRequestOtpPressed());
          },
          actionText: 'next'.tr(),
        );
      },
    );
  }
}
