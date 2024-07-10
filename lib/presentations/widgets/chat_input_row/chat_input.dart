import 'package:flutter/material.dart';
import 'package:gemini_app/core/extensions.dart';

class ChatInputField extends StatelessWidget {
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  /// Construct a Text Input Field for chat.
  const ChatInputField({
    required this.focusNode,
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: TextField(
          focusNode: focusNode,
          decoration: setDecoration(context),
          controller: controller,
          onSubmitted: onSubmitted,
        ),
      );

  InputDecoration setDecoration(BuildContext context) => InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Message Gemini',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: context.theme.colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: context.theme.colorScheme.secondary),
        ),
      );
}
