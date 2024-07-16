import 'package:flutter/material.dart';

///  A textfield to show the candidate count number.
class CandidateCountWidget extends StatelessWidget {
  /// Constructs an instance of a form field to get Candidate count from user.
  const CandidateCountWidget({
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
          labelText: 'Candidate Count',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null) {
            return 'Please enter valid candidate count';
          } else if (value.isNotEmpty &&
              ((int.tryParse(value) ?? 0) > 8 ||
                  (int.tryParse(value) ?? 0) < 1)) {
            return 'Candidate count should be in the range [1,8]';
          }
          return null;
        },
      );
}
