import 'package:flutter/material.dart';
import 'package:gemini_app/core/extensions/build_context.dart';

/// A widget to handle the chat input functionality.
class ChatInputField extends StatelessWidget {
  /// Constructs a Text Input Field for chat.
  const ChatInputField({
    required this.focusNode,
    required this.controller,
    super.key,
  });

  // /// Called when the user indicates that they are done editing the text.
  // final void Function(String)? onSubmitted;

  /// A [TextEditingController] that Controls the text being edited.
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Expanded(
        child: TextField(
          focusNode: focusNode,
          decoration: _setDecoration(context),
          controller: controller,
          // onSubmitted: onSubmitted,
        ),
      );

  InputDecoration _setDecoration(BuildContext context) => InputDecoration(
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
