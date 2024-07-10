import 'package:flutter/material.dart';

class TopKWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const TopKWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });
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
