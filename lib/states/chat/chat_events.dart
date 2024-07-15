/// Base class for chat events.
abstract class ChatEvent {}

/// An event dispatched When suer tries to send a text message.
class SendMessageEvent extends ChatEvent {
  /// creates an instance of [SendMessageEvent].
  SendMessageEvent({required this.message});

  /// user's message.
  final String message;
}

/// An event dispatched When suer tries to send an image.
class SendImageEvent extends ChatEvent {
  /// creates an instance of [SendImageEvent].
  SendImageEvent({required this.message});

  /// user's message.
  final String message;
}
