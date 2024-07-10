import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

class AttachWidget extends StatelessWidget {
  final void Function()? onPressed;

  const AttachWidget({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          Icons.add_photo_alternate_rounded,
          color: context.theme.colorScheme.primary,
        ),
        onPressed: onPressed,
      );
}
