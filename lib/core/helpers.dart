import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

/// Display error in case of any issues.
void showError(String message, BuildContext dialogContext) {
  showDialog<void>(
    context: dialogContext,
    builder: (context) {
      return AlertDialog(
        title: const Text('Something went wrong'),
        content: SingleChildScrollView(
          child: SelectableText(message),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}

/// handles navigation to chat screen.
Future<void> navigateToChatScreen(BuildContext context) async =>
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<ThemeBloc>(context),
          child: const ChatScreen(title: 'lets start to chat'),
        ),
      ),
    );

/// Handles yje navigation to the config screen.
Future<void> navigateToConfigScreen(BuildContext context) async =>
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ConfigScreen(),
      ),
    );
