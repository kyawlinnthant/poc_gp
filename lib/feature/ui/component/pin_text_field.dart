import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../core/theme/shape.dart';

class PinTextField extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final String errorMessage;
  final TextInputType? keyboardType;
  final bool enabled;
  final TextEditingController controller;

  const PinTextField({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.errorMessage = '',
    this.keyboardType,
    this.enabled = true,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 6,
      autoFocus: true,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      enableActiveFill: true,
      textStyle: context.textStyles.labelLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(Shapes.medium),
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveColor: context.colors.outline,
        activeColor: context.colors.primary,
        selectedColor: Colors.lightGreenAccent,
        activeFillColor: context.colors.surface,
        inactiveFillColor: context.colors.surface,
        selectedFillColor: context.colors.surface,
        errorBorderColor: context.colors.error,
      ),
      animationDuration: const Duration(milliseconds: 300),
      onCompleted: (otp) {
        onCompleted(otp);
      },
      onChanged: (value) {
        onChanged(value);
      },
      textInputAction: TextInputAction.done,
    );
  }
}
