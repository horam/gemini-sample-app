import 'package:flutter/material.dart';

class CandidateCountWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  /// Construct an instance of a form field to get Candidate count from user.
  const CandidateCountWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: const InputDecoration(
          labelText: 'Candidate Count',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null) {
            return 'Please enter valid candidate count';
          }
          return null;
        },
      );
}
