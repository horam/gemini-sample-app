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
          } else if (value.isNotEmpty &&
              ((num.tryParse(value) ?? 0) > 2.0 ||
                  (num.tryParse(value) ?? 0) < 0.0)) {
            return 'Temperature should be in the range [0.0,2.0]';
          }
          return null;
        },
      );
}
