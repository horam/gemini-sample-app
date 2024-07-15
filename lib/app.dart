import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:gemini_app/states/states.dart';

/// Sample app to investigate Gemini.
class GenerativeAIApp extends StatelessWidget {
  /// Constructs an instance of [GenerativeAIApp].
  const GenerativeAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = AppBlocObserver();
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: context.read<ThemeBloc>(),
      builder: (BuildContext context, ThemeState state) => MaterialApp(
        title: 'Generative AI',
        theme: state.themeData,
        home: const SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          ChatScreen.routeName: (context) => BlocProvider.value(
                value: BlocProvider.of<ThemeBloc>(context),
                child: const ChatScreen(),
              ),
          ConfigScreen.routeName: (context) => const ConfigScreen(),
        },
      ),
    );
  }
}
