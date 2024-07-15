import 'package:flutter/material.dart';

/// Display error in case of any issues.
Future<void> showError(String message, BuildContext dialogContext) async {
  await showDialog<void>(
    context: dialogContext,
    builder: (context) => AlertDialog(
      title: const Text('Something went wrong'),
      content: SingleChildScrollView(
        child: SelectableText(message),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
