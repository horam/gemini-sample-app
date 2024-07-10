import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// A widget to show the submit button in ConfigForm Screen.
class SubmitButton extends StatelessWidget {
  final void Function()? onPressed;

  /// Initialize a submit button instance.
  const SubmitButton({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
          // todo(Horam): add this color to the theme.
          backgroundColor: Colors.red,
          foregroundColor: context.theme.colorScheme.surface,
          fixedSize: Size(context.mediaQuery.size.width - 32, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        onPressed: onPressed,
        child: const Text('Submit'),
      );
}
