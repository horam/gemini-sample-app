import 'package:flutter/material.dart';
import 'package:gemini_app/core/extensions.dart';

class SendWidget extends StatelessWidget {
  final void Function()? onPressed;

  const SendWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          Icons.send,
          color: context.theme.colorScheme.primary,
        ),
        onPressed: onPressed,
      );
}
