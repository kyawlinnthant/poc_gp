import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/component/default_text_field.dart';
import 'package:poc/feature/ui/component/password_text_field.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/theme/dimen.dart';
import '../../../../../ui/component/phone_text_field.dart';
import '../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/state/ui_state.dart';
import '../../../../../ui/view/orientation.dart';
import '../bloc/signup_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
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
          context.pushReplacement(Routes.landing);
        }
      },

      builder: (context, state) {
        return ModalLoaderPlaceholder(
          isLoading: state.uiState is UiLoading,
          child: Scaffold(
            appBar: AppBar(),
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
                              'signupTitle'.tr(),
                              style: context.textStyles.titleLarge,
                            ),
                            VerticalSpacer(),
                            Text(
                              'signupDescription'.tr(),
                              style: context.textStyles.labelMedium,
                            ),
                            VerticalSpacer(height: Dimens.paddingBase3x),
                            DefaultTextField(
                              onChanged: (String value) {
                                context.read<SignupBloc>().add(
                                  OnUpdateEmail(value),
                                );
                              },
                              label: 'emailLabel'.tr(),
                              errorMessage: state.emailError,
                            ),
                            VerticalSpacer(),
                            PhoneTextField(
                              onChanged: (String v) {
                                context.read<SignupBloc>().add(
                                  OnUpdatePhone(v),
                                );
                              },
                              onClickPrefix: () {},
                              errorMessage: state.phoneError,
                              prefix: state.prefix,
                            ),
                            VerticalSpacer(),
                            PasswordTextField(
                              onChanged: (String value) {
                                context.read<SignupBloc>().add(
                                  OnUpdatePassword(value),
                                );
                              },
                              label: 'createPasswordLabel'.tr(),
                              errorMessage: state.passwordError,
                            ),
                            VerticalSpacer(),
                            PasswordTextField(
                              onChanged: (String value) {
                                context.read<SignupBloc>().add(
                                  OnUpdateConfirmPassword(value),
                                );
                              },
                              label: 'confirmPasswordLabel'.tr(),
                              errorMessage: state.confirmPasswordError,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'signupHint'.tr(),
                                style: context.textStyles.labelSmall,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'termsCondition'.tr(),
                                  style: context.textStyles.labelMedium
                                      ?.copyWith(color: context.colors.error),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: FilledButton(
                              onPressed: () {
                                context.read<SignupBloc>().add(
                                  OnSignupPressed(),
                                );
                              },
                              child: Text('signup'.tr()),
                            ),
                          ),
                        ],
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
