import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// provide the application's theme.
  ThemeData get theme => Theme.of(this);

  /// Provide MediaQuery's available data.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
