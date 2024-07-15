import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/core/core.dart';
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
            ? Icon(Icons.light_mode, color: context.theme.iconTheme.color)
            : Icon(Icons.dark_mode, color: context.theme.iconTheme.color),
        onPressed: () => themeBloc.add(SwitchThemeEvent()),
      ),
    );
  }
}
