import 'package:gemini_app/data/models/content.dart';

class ChatState {
  final String? response;
  final String? error;
  final bool isLoading;
  final int contentsCount;
  List<ChatContent> contents;

  ChatState({
    required this.response,
    required this.isLoading,
    required this.contentsCount,
    required this.contents,
    this.error,
  });

  factory ChatState.init() => ChatState(
        contentsCount: 0,
        contents: List.empty(growable: true),
        isLoading: false,
        response: null,
        error: null,
      );

  ChatState copyWith({
    bool? isLoading,
    String? response,
    int? contentsCount,
    List<ChatContent>? contents,
    String? error,
  }) =>
      ChatState(
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading,
        contentsCount: contentsCount ?? this.contentsCount,
        contents: contents ?? this.contents,
        error: error,
      );

  @override
  String toString() =>
      'ChatLoadedState(response: $response, isLoading, $isLoading,'
      ' contentsCount: $contentsCount, error: $error)';
}
