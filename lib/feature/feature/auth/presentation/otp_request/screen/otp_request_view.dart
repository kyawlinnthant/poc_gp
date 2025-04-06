import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/placeholder/modal_loader.dart';
import 'package:poc/feature/ui/view/orientation.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/theme/dimen.dart';
import '../../../../../ui/component/phone_text_field.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/state/ui_state.dart';
import '../bloc/request_otp_bloc.dart';

class RequestOtpView extends StatelessWidget {
  const RequestOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestOtpBloc, RequestOtpState>(
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
            Routes.otpVerify,
            extra: "${state.prefix}${state.phone}",
          );
        }
      },
      builder: (context, state) {
        return ModalLoaderPlaceholder(
          isLoading: state.uiState is UiLoading,
          child: Scaffold(
            appBar: AppBar(),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
              child: Center(
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
                              'otpRequestTitle'.tr(),
                              style: context.textStyles.titleLarge,
                            ),
                            VerticalSpacer(),
                            Text(
                              'otpRequestDescription'.tr(),
                              style: context.textStyles.labelMedium,
                            ),
                            VerticalSpacer(height: Dimens.paddingBase3x),
                            PhoneTextField(
                              onChanged: (String v) {
                                context.read<RequestOtpBloc>().add(
                                  OnUpdatePhone(v),
                                );
                              },
                              onClickPrefix: () {},
                              prefix: state.prefix,
                              errorMessage: state.phoneError,
                            ),
                            VerticalSpacer(),
                          ],
                        ),
                      ),
                    ),

                    SafeArea(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: Dimens.paddingBase2x,
                          ),
                          child: FilledButton(
                            onPressed: () {
                              context.read<RequestOtpBloc>().add(
                                OnRequestOtpPressed(),
                              );
                            },
                            child: Text('next'.tr()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
