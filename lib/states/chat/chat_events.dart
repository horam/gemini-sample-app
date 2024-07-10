abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  SendMessageEvent({required this.message});
  final String message;
}

class SendImageEvent extends ChatEvent {
  SendImageEvent({required this.message});

  final String message;
}
