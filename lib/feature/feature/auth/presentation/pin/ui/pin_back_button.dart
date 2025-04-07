import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';

class PinBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PinBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        splashColor: context.colors.error.withValues(alpha: Alpha.small),
        highlightColor: context.colors.error.withValues(alpha: Alpha.tiny),
        child: Padding(
          padding: EdgeInsets.all(
            Dimens.paddingBase,
          ), // adds tappable area around the icon
          child: Icon(
            Icons.arrow_back,
            color: context.colors.error, // or context.colors.error
            size: 30,
          ),
        ),
      ),
    );
  }
}
