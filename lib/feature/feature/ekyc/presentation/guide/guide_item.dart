import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/core/theme/shape.dart';
import 'package:poc/feature/ui/spacer/horizontal_spacer.dart';

import '../../../../../core/theme/dimen.dart';

class EkycGuideItem extends StatelessWidget {
  final String title;
  final String description;
  final String number;
  final IconData image;

  const EkycGuideItem({
    super.key,
    required this.title,
    required this.description,
    required this.number,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.paddingBase),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.outline.withValues(alpha: Alpha.small),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(Shapes.medium), // Rounded corners
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(Dimens.paddingSmall),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primaryContainer,
              border: Border.all(color: context.colors.outline, width: 1),
            ),
            child: Text(
              number,
              style: context.textStyles.labelSmall?.copyWith(
                color: context.colors.primary,
              ),
            ),
          ),
          HorizontalSpacer(),
          SizedBox(
            child: Icon(
              image,
              size: 45,
              color: context.colors.onPrimaryContainer,
            ),
          ),
          HorizontalSpacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.textStyles.titleSmall),
              Text(
                description,
                style: context.textStyles.labelMedium?.copyWith(
                  color: context.colors.outlineVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
