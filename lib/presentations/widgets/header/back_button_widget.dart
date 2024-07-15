import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// Back button in header section of our screens.
class BackButtonWidget extends StatelessWidget {
  /// Creates an instance of [BackButtonWidget].
  const BackButtonWidget({super.key});
  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.theme.iconTheme.color,
        ),
        onPressed: () => Navigator.pop(context),
      );
}
