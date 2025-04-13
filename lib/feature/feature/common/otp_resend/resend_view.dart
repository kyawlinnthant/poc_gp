import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/common/otp_resend/resend_cubit.dart';

class ResentView extends StatelessWidget {
  final VoidCallback onResend;
  const ResentView({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final countdownState = state['state'];
        final timeLeft = state['timeLeft'];

        if (countdownState == CountdownState.running) {
          return Row(
            children: [
              Text('resendCode'.tr(), style: context.textStyles.labelLarge),
              Text(" $timeLeft s", style: context.textStyles.labelLarge),
            ],
          );
        } else {
          return Row(
            children: [
              Text('notReceiveIt'.tr(), style: context.textStyles.labelLarge),
              TextButton(
                onPressed: () {
                  onResend();
                },
                child: Text(
                  'otp_resend'.tr(),
                  style: context.textStyles.labelLarge,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
