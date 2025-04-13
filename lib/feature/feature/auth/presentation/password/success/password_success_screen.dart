import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../../../../core/theme/dimen.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/view/orientation.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        context.go(Routes.login);
      },
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
                        Text(
                          'pwdSuccessTitle'.tr(),
                          style: context.textStyles.titleLarge,
                        ),
                        VerticalSpacer(),
                        Text(
                          'pwdSuccessDescription'.tr(),
                          style: context.textStyles.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Dimens.paddingBase2x),
                      child: FilledButton(
                        onPressed: () {
                          context.go(Routes.login);
                        },
                        child: Text('goLogin'.tr()),
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
  }
}
