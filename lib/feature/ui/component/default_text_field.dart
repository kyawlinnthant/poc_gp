import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../core/theme/shape.dart';

class DefaultTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String label, errorMessage;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool shownOverSolidBackground;

  const DefaultTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.errorMessage = '',
    this.keyboardType,
    this.enabled = true,
    this.shownOverSolidBackground = false,
  });

  @override
  DefaultTextFieldState createState() => DefaultTextFieldState();
}

class DefaultTextFieldState extends State<DefaultTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      controller: _controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.label,
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
        suffixIcon:
            _controller.text.isNotEmpty
                ? IconButton(
                  icon: Icon(Icons.close, color: context.colors.onSurface),
                  onPressed: () {
                    _controller.clear();
                    setState(() {});
                    widget.onChanged?.call('');
                  },
                )
                : null,
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
