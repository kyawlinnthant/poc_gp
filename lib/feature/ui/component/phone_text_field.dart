import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/ui/spacer/horizontal_spacer.dart';

import '../../../core/theme/shape.dart';

class PhoneTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? label;
  final String errorMessage;
  final bool enabled;
  final bool shownOverSolidBackground;
  final VoidCallback onClickPrefix;
  final String prefix;

  const PhoneTextField({
    super.key,
    required this.onChanged,
    this.label,
    this.errorMessage = '',
    this.enabled = true,
    this.shownOverSolidBackground = false,
    required this.onClickPrefix,
    required this.prefix,
  });

  @override
  PhoneTextFieldState createState() => PhoneTextFieldState();
}

class PhoneTextFieldState extends State<PhoneTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      controller: _controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: widget.label ?? 'phoneLabel'.tr(),
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
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: widget.onClickPrefix,
              child: Text('+${widget.prefix}'),
            ),
            SizedBox(
              width: 1.5,
              height: Dimens.paddingBase3x,
              child: Container(
                color: context.colors.onSurface.withValues(alpha: Alpha.tiny),
              ),
            ),
            HorizontalSpacer(),
          ],
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
