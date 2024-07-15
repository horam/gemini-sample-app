import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini_app/core/extensions/build_context.dart';
import 'package:gemini_app/presentations/presentations.dart';

/// A widget to show the messages in [ChatContentWidget].
class MessageWidget extends StatelessWidget {
  /// Constructs an instance of [MessageWidget]
  const MessageWidget({
    required this.isFromUser,
    super.key,
    this.image,
    this.text,
  });

  /// The chat's images.
  final Image? image;

  /// The chat's strings.
  final String? text;

  /// Is this message from the user or the model.
  final bool isFromUser;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment:
            isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 520),
              decoration: BoxDecoration(
                color: isFromUser
                    ? context.theme.colorScheme.primaryContainer
                    : context.theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  if (text case final text?)
                    MarkdownBody(
                      data: text,
                      styleSheet: MarkdownStyleSheet(
                        p: context.theme.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  if (image case final image?) image,
                ],
              ),
            ),
          ),
        ],
      );
}
