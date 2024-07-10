import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/states/states.dart';

class AppBarActions extends StatelessWidget {
  late final ThemeBloc _themeBloc;

  @override
  Widget build(BuildContext context) {
    _themeBloc = context.read<ThemeBloc>();
    return BlocBuilder(
      bloc: _themeBloc,
      builder: (context, ThemeState state) {
        return IconButton(
          icon: state.isDark
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
          onPressed: () => _themeBloc.add(SwitchThemeEvent()),
        );
      },
    );
  }
}
