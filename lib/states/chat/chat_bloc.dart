import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/states/chat/chat.dart';

/// A class the wraps the related logic to Chat.
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  /// Creates an instance of [ChatBloc].
  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatState.init()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<SendImageEvent>(_onImageMessageEvent);
  }
  final ChatRepository _chatRepository;

  Future<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    _chatRepository.addMessageToContent(event.message);
    emit(
      state.copyWith(
        isLoading: true,
        contentsCount: _chatRepository.contentCount,
        contents: _chatRepository.contents,
      ),
    );

    try {
      final String? response = await _chatRepository.sendTextMessage(
        event.message,
      );
      final int count = _chatRepository.contentCount;
      final List<ChatContent> contents = _chatRepository.contents;
      emit(
        state.copyWith(
          response: response,
          isLoading: false,
          contentsCount: count,
          contents: contents,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          error: 'No response from Gemini: $error.',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onImageMessageEvent(
    SendImageEvent event,
    Emitter<ChatState> emit,
  ) async {
    final file = await _chatRepository.addImageMessageToContent(
      event.message,
    );

    emit(
      state.copyWith(
        isLoading: true,
        contentsCount: _chatRepository.contentCount,
        contents: _chatRepository.contents,
      ),
    );
    try {
      final String? response = await _chatRepository.sendImagePrompt(
        event.message,
        file,
      );

      final int count = _chatRepository.contentCount;
      final List<ChatContent> contents = _chatRepository.contents;

      emit(
        state.copyWith(
          response: response,
          isLoading: false,
          contentsCount: count,
          contents: contents,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          error: 'No response from Gemini: $error.',
          isLoading: false,
        ),
      );
    }
  }
}
