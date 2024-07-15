import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/states/states.dart';

/// button to change the application theme based on [ThemeState].
class AppBarActions extends StatelessWidget {
  /// Creates an instance of [AppBarActions].
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return BlocBuilder(
      bloc: themeBloc,
      builder: (context, ThemeState state) => IconButton(
        icon: state.isDark
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
        onPressed: () => themeBloc.add(SwitchThemeEvent()),
      ),
    );
  }
}
