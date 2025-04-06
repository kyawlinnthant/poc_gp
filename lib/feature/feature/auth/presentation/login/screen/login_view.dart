import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/placeholder/modal_loader.dart';
import 'package:poc/feature/ui/state/ui_state.dart';
import 'package:poc/feature/ui/view/orientation.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../ui/component/password_text_field.dart';
import '../../../../../ui/component/phone_text_field.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
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
            body: OrientationView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'loginTitle'.tr(),
                        style: context.textStyles.displaySmall,
                      ),
                      Text(
                        'loginDescription'.tr(),
                        style: context.textStyles.labelMedium,
                      ),
                      VerticalSpacer(height: Dimens.paddingBase4x),
                      PhoneTextField(
                        onChanged: (String v) {
                          context.read<LoginBloc>().add(OnUpdatePhone(v));
                        },
                        onClickPrefix: () {},
                        errorMessage: state.phoneError,
                        prefix: state.prefix,
                      ),
                      VerticalSpacer(),
                      PasswordTextField(
                        onChanged: (String v) {
                          context.read<LoginBloc>().add(OnUpdatePassword(v));
                        },
                        errorMessage: state.passwordError,
                      ),
                      VerticalSpacer(height: Dimens.paddingBase2x),
                      SizedBox(
                        width: double.maxFinite,
                        child: FilledButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(OnLoginPressed());
                          },
                          child: Text('login'.tr()),
                        ),
                      ),
                      VerticalSpacer(),
                      SizedBox(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () {
                            context.push(Routes.forgotPassword);
                          },
                          child: Text('forgotPassword'.tr()),
                        ),
                      ),
                      VerticalSpacer(height: Dimens.paddingBase4x),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'newUser'.tr(),
                              style: context.textStyles.labelMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(Routes.otpRequest);
                              },
                              child: Text('signup'.tr()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'privacyPolicy'.tr(),
                                style: context.textStyles.labelMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: context.colors.error,
                                ),
                              ),
                            ),
                            Text('and'.tr()),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'termsOfUse'.tr(),
                                style: context.textStyles.labelMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: context.colors.error,
                                ),
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
          ),
        );
      },
    );
  }
}
