import 'package:flutter/material.dart';

/// A class to show content from user and AI.
class ChatContent {
  /// Constructs an instance of the [ChatContent].
  ChatContent({
    required this.fromUser,
    this.image,
    this.text,
  });

  /// Constructs a Chat Content instance from AI response.
  factory ChatContent.messageFromAI({required String? text}) => ChatContent(
        text: text,
        fromUser: false,
      );

  /// Constructs a Chat Content instance from user prompt.
  factory ChatContent.messageFromUserPrompt({required String? text}) =>
      ChatContent(
        text: text,
        fromUser: true,
      );

  /// Constructs a ChatContent from user prompt.
  factory ChatContent.imageFromUserPrompt({
    required String imageName,
    required String? text,
  }) =>
      ChatContent(
        image: Image.asset(imageName),
        text: text,
        fromUser: true,
      );

  /// An image loaded from the user.
  final Image? image;

  /// A text.
  final String? text;

  /// Is this content a user prompt or a AI response.
  final bool fromUser;
}
