import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// A widget to show attach button and handle its functionality.
class AttachWidget extends StatelessWidget {
  /// Constructs a button to attach files to the chat.
  const AttachWidget({
    required this.onPressed,
    super.key,
  });

  /// The callback that is called when the button is tapped or activated.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          Icons.add_photo_alternate_rounded,
          color: context.theme.iconTheme.color,
        ),
        onPressed: onPressed,
      );
}
