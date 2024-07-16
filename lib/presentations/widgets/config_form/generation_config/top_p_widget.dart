import 'package:flutter/material.dart';

/// A widget to receive models' top-p value from user.
class TopPWidget extends StatelessWidget {
  /// Constrict an instance of [TopPWidget].
  const TopPWidget({
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
          labelText: 'Top P',
          border: OutlineInputBorder(),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value == null) {
            return 'Please enter top P';
          } else if (value.isNotEmpty &&
              ((num.tryParse(value) ?? 0) > 1.0 ||
                  (num.tryParse(value) ?? 0) < 0.0)) {
            return 'Top-P should be in the range [0.0, 1.0]';
          }
          return null;
        },
      );
}
