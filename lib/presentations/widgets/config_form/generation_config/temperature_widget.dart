import 'package:flutter/material.dart';

/// A widget to receive models' temperature from user.
class TemperatureWidget extends StatelessWidget {
  /// Constructs an instance of [TemperatureWidget].
  const TemperatureWidget({
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
          labelText: 'Temperature',
          border: OutlineInputBorder(),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value == null) {
            return 'Please enter valid temperature.';
          }
          return null;
        },
      );
}
