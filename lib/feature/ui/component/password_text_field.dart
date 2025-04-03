import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../core/theme/shape.dart';

class PasswordTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? label;
  final String errorMessage;
  final bool enabled;
  final bool shownOverSolidBackground;

  const PasswordTextField({
    super.key,
    required this.onChanged,
    this.label,
    this.errorMessage = '',
    this.enabled = true,
    this.shownOverSolidBackground = false,
  });

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      controller: _controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !_isPasswordVisible,
      // Hide password
      decoration: InputDecoration(
        hintText: widget.label ?? 'passwordLabel'.tr(),
        hintStyle: context.textStyles.labelMedium?.copyWith(
          color: context.colors.onSurface.withValues(alpha: Alpha.half),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Shapes.medium),
          borderSide: BorderSide(color: context.colors.surface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Shapes.medium),
          borderSide: BorderSide(
            color:
                widget.shownOverSolidBackground
                    ? context.colors.surface
                    : context.colors.onSurface.withValues(alpha: Alpha.tiny),
          ),
        ),
        errorText: widget.errorMessage.isNotEmpty ? widget.errorMessage : null,
        focusColor: context.colors.primary,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Shapes.medium),
          borderSide: BorderSide(
            color:
                widget.shownOverSolidBackground
                    ? context.colors.surface
                    : context.colors.onSurface,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Shapes.medium),
          borderSide: BorderSide(color: context.colors.error),
        ),
        fillColor: context.colors.surface,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: context.colors.onSurface,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      onChanged: (value) {
        setState(() {}); // Refresh UI for clear button
        widget.onChanged?.call(value);
      },
      maxLines: 1,
      cursorColor: context.colors.onSurface,
    );
  }
}
