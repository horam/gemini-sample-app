import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const TemperatureWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });
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
