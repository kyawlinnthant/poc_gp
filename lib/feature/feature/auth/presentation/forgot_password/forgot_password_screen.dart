import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../../../core/theme/dimen.dart';
import '../../../../ui/component/phone_text_field.dart';
import '../../../../ui/placeholder/modal_loader.dart';
import '../../../../ui/spacer/vertical_spacer.dart';
import '../../../../ui/view/orientation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(title: Text('forgotPassword'.tr())),
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
                          'forgotPasswordTitle'.tr(),
                          style: context.textStyles.titleLarge,
                        ),
                        VerticalSpacer(),
                        Text(
                          'forgotPasswordDescription'.tr(),
                          style: context.textStyles.labelMedium,
                        ),
                        VerticalSpacer(height: Dimens.paddingBase3x),
                        PhoneTextField(
                          onChanged: (String v) {},
                          onClickPrefix: () {},
                          prefix: '60',
                        ),
                        VerticalSpacer(),
                      ],
                    ),
                  ),
                ),

                SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('next'.tr()),
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
