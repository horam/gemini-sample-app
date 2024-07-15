import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_app/states/theme/theme.dart';

/// A class that handles the chat with gemini app.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// Constructs an instance of the [ThemeBloc].
  ThemeBloc() : super(ThemeState.dark()) {
    on<SwitchThemeEvent>(_onSwitchTheme);
  }

  Future<void> _onSwitchTheme(
    SwitchThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.isDark ? ThemeState.light() : ThemeState.dark());
  }
}
