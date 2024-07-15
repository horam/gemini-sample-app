import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// A widget to show the submit button in ConfigForm Screen.
class SubmitButton extends StatelessWidget {
  /// Initialize a submit button instance.
  const SubmitButton({
    required this.onPressed,
    super.key,
  });

  /// A callback that is called after users' click.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        style: context.theme.textButtonTheme.style?.copyWith(
          fixedSize: WidgetStateProperty.all(
            Size(context.mediaQuery.size.width - 32, 36),
          ),
        ),
        onPressed: onPressed,
        child: const Text('Submit'),
      );
}
