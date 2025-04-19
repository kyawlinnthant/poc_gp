import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/theme/dimen.dart';
import '../../../../ui/spacer/vertical_spacer.dart';
import '../../../../ui/view/orientation.dart';

class EkycSuccessScreen extends StatelessWidget {
  const EkycSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/image/svg/ekyc_success.svg';
    return Scaffold(
      backgroundColor: context.colors.primary,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: OrientationView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: SvgPicture.asset(
                              assetName,
                              semanticsLabel: 'EKYC Success',
                              colorFilter: ColorFilter.mode(
                                context.colors.surface,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        VerticalSpacer(height: Dimens.paddingBase3x),
                        Text(
                          'ekycSuccessTitle'.tr(),
                          style: context.textStyles.titleLarge?.copyWith(
                            color: context.colors.surface,
                          ),
                        ),
                        VerticalSpacer(),
                        Text(
                          'ekycSuccessDescription'.tr(),
                          style: context.textStyles.labelMedium?.copyWith(
                            color: context.colors.surface,
                          ),
                        ),
                      ],
                    ),
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
                        context.go(Routes.landing);
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: context.colors.surface,
                      ),
                      child: Text(
                        'allSet'.tr(),
                        style: context.textStyles.labelMedium?.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
