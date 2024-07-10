import 'package:flutter/material.dart';

/// An error screen for cases that we fail to load the keys
class KeyErrorWidget extends StatelessWidget {
  /// construct an error screen for cases that we fail to load the keys.
  const KeyErrorWidget({super.key});
  @override
  Widget build(BuildContext context) => ListView(
        children: const [
          Text(
            'No API key found. Please provide an API Key using '
            "'--dart-define' to set the 'API_KEY' declaration.",
          ),
        ],
      );
}
