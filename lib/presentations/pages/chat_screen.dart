import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/core/core.dart';

import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

/// A widget that displays the chat page.
class ChatScreen extends StatelessWidget {
  /// Constructs an instance of [ChatScreen] widget.
  const ChatScreen({super.key});

  /// [ChatScreen] route name to be used in routing system.
  static const routeName = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    final settings =
        ModalRoute.of(context)!.settings.arguments! as ModelSettings;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColorDark,
        elevation: 8,
        title: Text(
          'model: ${context.read<ChatRepository>().modelName}',
          style: context.theme.textTheme.titleLarge,
        ),
        leading: const BackButtonWidget(),
        actions: <Widget>[
          BlocProvider.value(
            value: BlocProvider.of<ThemeBloc>(context),
            child: const AppBarActions(),
          ),
        ],
      ),
      body: BlocProvider<ChatBloc>(
        create: (BuildContext context) => ChatBloc(
          chatRepository: context.read<ChatRepository>()
            ..init(settings: settings),
        ),
        child: const ChatContentWidget(apiKey: API.apiKey),
      ),
    );
  }
}
