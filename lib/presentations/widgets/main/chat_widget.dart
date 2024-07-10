import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

class ChatContentWidget extends StatefulWidget {
  const ChatContentWidget({
    required this.apiKey,
    super.key,
  });

  final String apiKey;

  @override
  State<ChatContentWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatContentWidget> {
  late final ChatBloc _chatBloc;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _chatBloc = context.read<ChatBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: widget.apiKey.isNotEmpty
                ? _buildChatMessages()
                : const KeyErrorWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: _buildBottomRow(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages() => BlocConsumer(
        bloc: _chatBloc,
        listener: (BuildContext context, ChatState state) {
          if (state.error != null) {
            showError(state.error!, context);
          }
        },
        listenWhen: (ChatState previous, ChatState current) {
          return current != previous && current.isLoading == false;
        },
        builder: (BuildContext context, ChatState state) {
          final List<ChatContent> contents = state.contents;
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              final ChatContent content = contents[index];
              return MessageWidget(
                text: content.text,
                image: content.image,
                isFromUser: content.fromUser,
              );
            },
            itemCount: state.contentsCount,
          );
        },
      );

  Widget _buildBottomRow() => BlocBuilder(
      bloc: _chatBloc,
      builder: (BuildContext context, ChatState state) {
        return Row(
          children: [
            ChatInputField(
              focusNode: _textFieldFocus,
              controller: _textController,
              onSubmitted: (message) => _sendChatMessage(message),
            ),
            const SizedBox.square(dimension: 15),
            AttachWidget(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      _sendImagePrompt(_textController.text);
                    },
            ),
            _buildSendWidget(state),
          ],
        );
      });

  Widget _buildSendWidget(ChatState state) => state.isLoading
      ? const CircularProgressIndicator()
      : SendWidget(
          onPressed: () async {
            if (_textController.text.trim().isNotEmpty) {
              _chatBloc.add(
                SendMessageEvent(message: _textController.text),
              );
            }
          },
        );

  Future<void> _sendImagePrompt(String message) async {
    _chatBloc.add(SendImageEvent(message: message));
    _scrollDown();
    _disposeChatTextHandlers();
  }

  Future<void> _sendChatMessage(String message) async {
    _chatBloc.add(SendMessageEvent(message: message));
    _scrollDown();
    _disposeChatTextHandlers();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void _disposeChatTextHandlers() {
    _textController.clear();
    _textFieldFocus.requestFocus();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _disposeChatTextHandlers();

    super.dispose();
  }
}
