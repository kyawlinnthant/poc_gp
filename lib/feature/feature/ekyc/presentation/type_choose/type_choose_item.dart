import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/core/theme/shape.dart';

import '../../../../../core/theme/dimen.dart';
import '../../../../ui/spacer/vertical_spacer.dart';

class TypeChooseItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onClick;

  const TypeChooseItem({
    super.key,
    required this.title,
    required this.description,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(Shapes.medium),
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimens.paddingBase3x),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.outline.withValues(alpha: Alpha.small),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Shapes.medium),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(title, style: context.textStyles.displaySmall),
                ),
                VerticalSpacer(),
                Center(
                  child: Text(
                    description,
                    style: context.textStyles.labelMedium,
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
