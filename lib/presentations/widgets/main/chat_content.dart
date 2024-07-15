import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

/// A widget to show chat message in the chat screen.
class ChatContentWidget extends StatefulWidget {
  /// Constructs an instance of the chat message in the chat screen.
  const ChatContentWidget({
    required this.isAPILoaded,
    super.key,
  });

  /// Whether app has  a valid
  final bool isAPILoaded;

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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: widget.isAPILoaded
                  ? _buildChatMessages()
                  : const KeyErrorWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              child: _buildBottomRow(),
            ),
          ],
        ),
      );

  Widget _buildChatMessages() => BlocConsumer(
        bloc: _chatBloc,
        listener: (BuildContext context, ChatState state) async {
          if (state.error != null) {
            await showError(state.error!, context);
          } else if (!state.isLoading) {
            _scrollDown();
          }
        },
        listenWhen: (ChatState previous, ChatState current) =>
            current != previous && !current.isLoading,
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
        builder: (BuildContext context, ChatState state) => Row(
          children: <Widget>[
            ChatInputField(
              focusNode: _textFieldFocus,
              controller: _textController,
            ),
            const SizedBox.square(dimension: 15),
            AttachWidget(
              onPressed: state.isLoading
                  ? null
                  : () async => _sendImagePrompt(_textController.text),
            ),
            SendWidget(
              isLoading: state.isLoading,
              onPressed: () async {
                if (_textController.text.trim().isNotEmpty) {
                  await _sendChatMessage(_textController.text);
                }
              },
            ),
          ],
        ),
      );

  Future<void> _sendImagePrompt(String message) async {
    _scrollDown();
    _chatBloc.add(SendImageEvent(message: message));
    _disposeChatTextHandlers();
  }

  Future<void> _sendChatMessage(String message) async {
    _scrollDown();
    _chatBloc.add(SendMessageEvent(message: message));
    _disposeChatTextHandlers();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => _scrollController.animateTo(
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
