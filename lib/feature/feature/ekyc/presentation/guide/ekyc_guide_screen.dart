import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/ekyc/presentation/guide/guide_item.dart';

import '../../../../../../core/theme/dimen.dart';
import '../../../../ui/spacer/vertical_spacer.dart';
import '../../../../ui/view/orientation.dart';

class EkycGuideScreen extends StatelessWidget {
  const EkycGuideScreen({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacer(height: Dimens.paddingBase3x),
                    Text(
                      'ekycGuideTitle'.tr(),
                      style: context.textStyles.titleLarge,
                    ),
                    VerticalSpacer(),
                    Text(
                      'ekycGuideDescription'.tr(),
                      style: context.textStyles.labelMedium,
                    ),
                    VerticalSpacer(height: Dimens.paddingBase3x),
                    EkycGuideItem(
                      title: 'ekycGuide1Title'.tr(),
                      description: 'ekycGuide1Description'.tr(),
                      number: '1',
                      image: Icons.type_specimen,
                    ),
                    VerticalSpacer(),
                    EkycGuideItem(
                      title: 'ekycGuide2Title'.tr(),
                      description: 'ekycGuide2Description'.tr(),
                      number: '2',
                      image: Icons.credit_card,
                    ),
                    VerticalSpacer(),
                    EkycGuideItem(
                      title: 'ekycGuide3Title'.tr(),
                      description: 'ekycGuide3Description'.tr(),
                      number: '3',
                      image: Icons.camera_alt_outlined,
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
                    onPressed: () {},
                    child: Text('alright'.tr()),
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
