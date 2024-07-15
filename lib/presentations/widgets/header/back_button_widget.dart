import 'package:flutter/material.dart';

/// Back button in header section of our screens.
class BackButtonWidget extends StatelessWidget {
  /// Creates an instance of [BackButtonWidget].
  const BackButtonWidget({super.key});
  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      );
}
