import 'package:flutter/material.dart';

class ThemeState {
  ThemeData themeData;

  ThemeState(this.themeData);

  factory ThemeState.light() =>
      ThemeState(ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color.fromARGB(255, 31, 45, 244),
        ),
      ));

  factory ThemeState.dark() => ThemeState(
        ThemeData.dark(useMaterial3: true).copyWith(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 31, 45, 244),
          ),
        ),
      );

  bool get isDark => themeData.brightness == Brightness.dark;
}
