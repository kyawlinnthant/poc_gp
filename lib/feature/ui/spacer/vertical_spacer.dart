import 'package:flutter/material.dart';
import 'package:poc/core/theme/dimen.dart';

class VerticalSpacer extends StatelessWidget {
  final double? height;

  const VerticalSpacer({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? Dimens.paddingBase);
  }
}
