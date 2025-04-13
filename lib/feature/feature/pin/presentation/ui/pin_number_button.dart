import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

class PinNumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const PinNumberButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.secondaryContainer,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          height: 70, // adjust size as needed
          width: 70,
          child: Center(
            child: Text(
              number,
              style: context.textStyles.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
