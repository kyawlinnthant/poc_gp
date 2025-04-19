import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/ekyc/presentation/type_choose/type_choose_item.dart';

import '../../../../../../core/theme/dimen.dart';
import '../../../../ui/spacer/horizontal_spacer.dart';
import '../../../../ui/spacer/vertical_spacer.dart';
import '../../../../ui/view/orientation.dart';

class EkycTypeChooseScreen extends StatelessWidget {
  const EkycTypeChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: OrientationView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.type_specimen,
                      size: 32,
                      color: context.colors.onPrimaryContainer,
                    ),
                  ),
                  HorizontalSpacer(),
                  Text(
                    'ekycGuide1Title'.tr(),
                    style: context.textStyles.titleLarge,
                  ),
                ],
              ),
              VerticalSpacer(),
              Text(
                'ekycChooseTypeDescription'.tr(),
                style: context.textStyles.labelMedium,
              ),
              VerticalSpacer(height: Dimens.paddingBase3x),
              TypeChooseItem(
                title: 'ekycType1Title'.tr(),
                description: 'ekycType1Description'.tr(),
                onClick: () {},
              ),
              VerticalSpacer(),
              TypeChooseItem(
                title: 'ekycType2Title'.tr(),
                description: 'ekycType2Description'.tr(),
                onClick: () {
                  context.push(Routes.eKycPp1);
                },
              ),
              VerticalSpacer(),
              TypeChooseItem(
                title: 'ekycType3Title'.tr(),
                description: 'ekycType3Description'.tr(),
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
