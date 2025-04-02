import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/spacer/vertical_spacer.dart';

class ErrorPlaceholder extends StatelessWidget {
  final VoidCallback onRetry;
  final String message;

  const ErrorPlaceholder({
    super.key,
    required this.onRetry,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message, style: context.textStyles.labelMedium),
        VerticalSpacer(),
        OutlinedButton(
          onPressed: onRetry,
          child: Text('tryAgain'.tr(), style: context.textStyles.labelMedium),
        ),
      ],
    );
  }
}
