import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/states/chat/chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatState.init()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<SendImageEvent>(_onImageMessageEvent);
  }

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final String? response = await _chatRepository.sendMessage(event.message);
      final int count = _chatRepository.contentCount;
      final List<ChatContent> contents = _chatRepository.contents;
      emit(
        ChatState(
          response: response,
          isLoading: false,
          contentsCount: count,
          contents: contents,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(error: 'No response from Gemini.', isLoading: false),
      );
    }
  }

  Future<void> _onImageMessageEvent(
    SendImageEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final String? response = await _chatRepository.sendImagePrompt(
        event.message,
      );
      final int count = _chatRepository.contentCount;
      final List<ChatContent> contents = _chatRepository.contents;

      emit(
        ChatState(
          response: response,
          isLoading: false,
          contentsCount: count,
          contents: contents,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(error: 'No response from Gemini.', isLoading: false),
      );
    }
  }
}
