import 'package:flutter/material.dart';

/// A class to show content from user and AI.
class ChatContent {
  ChatContent({
    this.image,
    this.text,
    required this.fromUser,
  });

  /// Construct a Chat Content instance from AI response.
  factory ChatContent.messageFromAI({required String? text}) => ChatContent(
        image: null,
        text: text,
        fromUser: false,
      );

  /// Construct a Chat Content instance from user prompt.
  factory ChatContent.messageFromUserPrompt({required String? text}) =>
      ChatContent(
        image: null,
        text: text,
        fromUser: true,
      );

  /// Construct a ChatContent from user prompt.
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
