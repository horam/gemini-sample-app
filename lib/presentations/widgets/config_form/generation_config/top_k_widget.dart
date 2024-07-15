import 'package:flutter/material.dart';

/// A widget to receive models' top-k value from user.
class TopKWidget extends StatelessWidget {
  /// Constructs an instance of [TopKWidget].
  const TopKWidget({
    required this.controller,
    required this.focusNode,
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
          labelText: 'Top K',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null) {
            return 'Please enter top K';
          }
          return null;
        },
      );
}
