import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

Future<void> showLogoutDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close dialog
            child: Text(
              "Cancel",
              style: context.textStyles.labelMedium?.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              onConfirm(); // Execute logout function
            },
            child: Text(
              "Logout",
              style: context.textStyles.labelMedium?.copyWith(
                color: context.colors.error,
              ),
            ),
          ),
        ],
      );
    },
  );
}
