import 'package:flutter/material.dart';

/// A class that wrap the application's theme state.
class ThemeState {
  /// Constructs an instance of [ThemeState].
  ThemeState({required this.themeData});

  /// Constructs a light version of the theme.
  factory ThemeState.light() => ThemeState(
        themeData: ThemeData.light(useMaterial3: true).copyWith(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black54,
            size: 24,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 31, 45, 244),
          ),
        ),
      );

  /// Constructs a dark version of the theme.
  factory ThemeState.dark() => ThemeState(
        themeData: ThemeData.dark(useMaterial3: true).copyWith(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 31, 45, 244),
          ),
        ),
      );

  /// The theme that that application uses in each state.
  ThemeData themeData;

  /// returns whether the [Brightness] is dark or light.
  bool get isDark => themeData.brightness == Brightness.dark;
}
