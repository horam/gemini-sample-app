import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.dark()) {
    on<SwitchThemeEvent>(_onSwitchTheme);
  }

  Future<void> _onSwitchTheme(
      SwitchThemeEvent event, Emitter<ThemeState> emit) async {
    emit(state.isDark ? ThemeState.light() : ThemeState.dark());
  }
}
