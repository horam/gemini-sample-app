import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/app.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/states/states.dart';

void main() async {
  /// fetch the key from .env file.

  await API().init();

  runApp(
    RepositoryProvider(
      create: (_) => ChatRepository(),
      child: BlocProvider(
        create: (_) => ThemeBloc(),
        child: const GenerativeAIApp(),
      ),
    ),
  );
}
