import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/core/theme/shape.dart';
import 'package:poc/feature/feature/auth/presentation/pin/ui/pin_back_button.dart';
import 'package:poc/feature/feature/auth/presentation/pin/ui/pin_number_button.dart';

import '../../../../../ui/placeholder/modal_loader.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'createPinTitle'.tr(),
                  style: context.textStyles.displaySmall,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'createPinDescription'.tr(),
                  style: context.textStyles.labelMedium,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.paddingStandard,
                vertical: Dimens.paddingBase4x,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: CircleAvatar(
                        radius: Shapes.medium,
                        backgroundColor:
                            index < 2
                                ? context.colors.primary
                                : context.colors.outline.withValues(
                                  alpha: Alpha.tiny,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Number pad
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase4x),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: Dimens.paddingBase2x,
                crossAxisSpacing: Dimens.paddingBase2x,
                childAspectRatio: 1,
                children: [
                  ...List.generate(
                    9,
                    (i) => PinNumberButton(
                      number: (i + 1).toString(),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox.shrink(),
                  PinNumberButton(number: '0', onPressed: () {}),
                  PinBackButton(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
