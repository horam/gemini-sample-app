import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// A widget to show primary button in the entire application.
class PrimaryButton extends StatelessWidget {
  /// Create an instance of [PrimaryButton].
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  /// A callback that is called after users' click.
  final void Function()? onPressed;

  /// a A text to be shown on the button.
  final String text;

  @override
  Widget build(BuildContext context) => TextButton(
        style: context.theme.textButtonTheme.style?.copyWith(
          fixedSize: WidgetStateProperty.all(
            Size(context.mediaQuery.size.width - 32, 48),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      );
}
