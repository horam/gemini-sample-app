import 'package:flutter/material.dart';
import 'package:gemini_app/core/extensions/build_context.dart';

/// A widget to show send button and handle its functionality.
class SendWidget extends StatelessWidget {
  /// Constructs an instance of the [SendWidget].
  const SendWidget({
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  /// The callback that is called when the button is tapped or activated.
  final void Function()? onPressed;

  /// Determines if model is busy generating response.
  final bool isLoading;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          isLoading ? Icons.pending_outlined : Icons.send,
          color: context.theme.iconTheme.color,
        ),
        onPressed: isLoading ? null : onPressed,
      );
}
