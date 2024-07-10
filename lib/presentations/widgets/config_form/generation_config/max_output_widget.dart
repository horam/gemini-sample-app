import 'package:flutter/material.dart';

class MaxOutputTokenWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const MaxOutputTokenWidget({
    super.key,
    required this.focusNode,
    required this.controller,
  });
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
          } else if ((int.tryParse(value) ?? 0) > 8 ||
              (int.tryParse(value) ?? 0) < 1) {
            return 'Max Output token should be in the range [1,8]';
          }
          return null;
        },
      );
}
