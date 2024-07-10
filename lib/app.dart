import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/presentations/pages/splash_screen.dart';
import 'package:gemini_app/states/states.dart';

class GenerativeAIApp extends StatelessWidget {
  const GenerativeAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = AppBlocObserver();
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: context.read<ThemeBloc>(),
      builder: (BuildContext context, ThemeState state) {
        return MaterialApp(
          title: 'Generative AI',
          theme: state.themeData,
          home: const SplashScreen(),
        );
      },
    );
  }
}
