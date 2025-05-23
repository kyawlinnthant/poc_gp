import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/theme/dimen.dart';
import '../../../../../ui/spacer/horizontal_spacer.dart';
import '../../../../../ui/view/orientation.dart';

class EkycPassportOneScreen extends StatelessWidget {
  const EkycPassportOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: OrientationView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.credit_card,
                            size: 32,
                            color: context.colors.onPrimaryContainer,
                          ),
                        ),
                        HorizontalSpacer(),
                        Text(
                          'ekycGuide2Title'.tr(),
                          style: context.textStyles.titleLarge,
                        ),
                      ],
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
                      context.push(Routes.eKycSelfieTake);
                    },
                    child: Text('saveContinue'.tr()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
