import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  bool shouldShowAction = false,
  VoidCallback? onClickOk,
}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
    action:
        shouldShowAction
            ? SnackBarAction(label: 'OK', onPressed: onClickOk!)
            : null,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
