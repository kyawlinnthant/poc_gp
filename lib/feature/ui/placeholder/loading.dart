import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

class LoadingPlaceholder extends StatelessWidget {
  final Color? color;

  const LoadingPlaceholder({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color ?? context.colors.primary);
  }
}
