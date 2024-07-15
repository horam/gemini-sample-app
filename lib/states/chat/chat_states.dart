import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/models/content.dart';

/// A class to keeps the state of user's chat.
class ChatState {
  /// Construct an instance of [ChatState].
  ChatState({
    required this.response,
    required this.isLoading,
    required this.contentsCount,
    required this.contents,
    required this.model,
    this.error,
  });

  /// Initialize the [ChatState].
  factory ChatState.init() => ChatState(
        contentsCount: 0,
        model: ModelType.defaultModel,
        contents: List.empty(growable: true),
        isLoading: false,
        response: null,
      );

  /// Model's response to user's prompt.
  final String? response;

  /// The error message that model sends.
  final String? error;

  /// Is the model generating the response.
  final bool isLoading;

  /// number of chat contents.
  final int contentsCount;

  /// chat's model type.
  final ModelType model;

  /// List of chat contents.
  List<ChatContent> contents;

  /// Crates a new instance of the current state.
  ChatState copyWith({
    bool? isLoading,
    String? response,
    int? contentsCount,
    List<ChatContent>? contents,
    String? error,
    ModelType? model,
  }) =>
      ChatState(
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading,
        contentsCount: contentsCount ?? this.contentsCount,
        contents: contents ?? this.contents,
        model: model ?? this.model,
        error: error,
      );

  @override
  String toString() => 'ChatLoadedState(Model: $model, response: $response, '
      'isLoading, $isLoading, contentsCount: $contentsCount, error: $error)';
}
