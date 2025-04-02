import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/placeholder/modal_loader.dart';
import 'package:poc/feature/ui/view/orientation.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../../../data/store/app_data/app_data_store.dart';
import '../../../../../data/store/app_data/app_launch_mode.dart';
import '../../../../ui/component/password_text_field.dart';
import '../../../../ui/component/phone_text_field.dart';
import '../../../../ui/spacer/vertical_spacer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: false,
      child: Scaffold(
        body: OrientationView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'loginLabel'.tr(),
                    style: context.textStyles.displaySmall,
                  ),
                  VerticalSpacer(height: Dimens.paddingBase4x),
                  PhoneTextField(
                    onChanged: (String v) {},
                    onClickPrefix: () {},
                  ),
                  VerticalSpacer(),
                  PasswordTextField(onChanged: (String v) {}),
                  VerticalSpacer(height: Dimens.paddingBase2x),
                  SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                      onPressed: () async {
                        saveAppLaunchState();
                        context.pushReplacement(Routes.landing);
                      },
                      child: Text('login'.tr()),
                    ),
                  ),
                  VerticalSpacer(),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      onPressed: () {},
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
                          onPressed: () {},
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
  }

  void saveAppLaunchState() async {
    final appDataStore = getIt.get<AppDataStore>();
    await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.landing);
  }
}
