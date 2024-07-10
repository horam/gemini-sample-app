import 'package:flutter/material.dart';

class TopPWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const TopPWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

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
          }
          return null;
        },
      );
}
