import 'package:flutter/material.dart';

import 'loading.dart';

class ModalLoaderPlaceholder extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const ModalLoaderPlaceholder({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: ModalBarrier(color: Colors.black.withValues(alpha: 0.6)),
          ),

        if (isLoading)
          Positioned.fill(
            // Ensure it covers the entire screen
            child: const Center(child: LoadingPlaceholder()),
          ),
      ],
    );
  }
}
