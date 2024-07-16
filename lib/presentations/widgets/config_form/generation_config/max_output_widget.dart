import 'package:flutter/material.dart';

/// A widget to receive number of models' max output token from user.
class MaxOutputTokenWidget extends StatelessWidget {
  /// Constructs an instance of [MaxOutputTokenWidget].
  const MaxOutputTokenWidget({
    required this.focusNode,
    required this.controller,
    super.key,
  });

  /// A [TextEditingController] for the [TextFormField] widget.
  final TextEditingController controller;

  /// A focus node for the [TextFormField] widget.
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: const InputDecoration(
          labelText: 'Max Output Tokens',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null) {
            return 'Please enter max output tokens';
          } else if (value.isNotEmpty &&
              ((num.tryParse(value) ?? 0) > 8 ||
                  (num.tryParse(value) ?? 0) < 1)) {
            return 'Max Output token should be in the range [1,8]';
          }
          return null;
        },
      );
}
