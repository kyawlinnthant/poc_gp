import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/component/default_text_field.dart';
import 'package:poc/feature/ui/component/password_text_field.dart';

import '../../../../../../../core/navigation/routes.dart';
import '../../../../../../../core/theme/dimen.dart';
import '../../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../../ui/prompt/snackbar.dart';
import '../../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../../ui/state/ui_state.dart';
import '../../../../../../ui/view/orientation.dart';
import '../bloc/register_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
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
          context.go(Routes.registerSuccess);
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
                                context.read<RegisterBloc>().add(
                                  OnUpdateEmail(value),
                                );
                              },
                              label: 'emailLabel'.tr(),
                              errorMessage: state.emailError,
                            ),

                            VerticalSpacer(),
                            PasswordTextField(
                              onChanged: (String value) {
                                context.read<RegisterBloc>().add(
                                  OnUpdatePassword(value),
                                );
                              },
                              label: 'createPasswordLabel'.tr(),
                              errorMessage: state.passwordError,
                            ),
                            VerticalSpacer(),
                            PasswordTextField(
                              onChanged: (String value) {
                                context.read<RegisterBloc>().add(
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
                      child: Padding(
                        padding: EdgeInsets.only(bottom: Dimens.paddingBase),
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
                                  context.read<RegisterBloc>().add(
                                    OnSignupPressed(),
                                  );
                                },
                                child: Text('signup'.tr()),
                              ),
                            ),
                          ],
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
