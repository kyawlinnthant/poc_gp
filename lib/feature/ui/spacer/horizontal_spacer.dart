import 'package:flutter/material.dart';
import 'package:poc/core/theme/dimen.dart';

class HorizontalSpacer extends StatelessWidget {
  final double? width;

  const HorizontalSpacer({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? Dimens.paddingBase);
  }
}
