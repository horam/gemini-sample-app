import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/core/core.dart';

import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.primary,
        title: Text(
          title,
          style: context.theme.textTheme.titleLarge
              ?.copyWith(color: context.theme.colorScheme.onSurface),
        ),
        actions: [
          BlocProvider.value(
            value: BlocProvider.of<ThemeBloc>(context),
            child: AppBarActions(),
          )
        ],
      ),
      body: BlocProvider<ChatBloc>(
        create: (BuildContext context) => ChatBloc(
          chatRepository: context.read<ChatRepository>()..init(),
        ),
        child: const ChatContentWidget(apiKey: API.apiKey),
      ),
    );
  }
}
