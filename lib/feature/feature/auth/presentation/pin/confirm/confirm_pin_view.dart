import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../../../../core/theme/dimen.dart';
import '../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/view/orientation.dart';

class ConfirmPinView extends StatelessWidget {
  const ConfirmPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
          child: OrientationView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(),
                Text(
                  'confirmPinTitle'.tr(),
                  style: context.textStyles.titleLarge,
                ),
                VerticalSpacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
