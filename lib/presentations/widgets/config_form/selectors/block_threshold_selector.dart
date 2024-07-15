import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// A widget to receives's users's preference for block threshold,
class BlockThresholdSelector extends StatelessWidget {
  /// Constructs an instance of [BlockThresholdSelector].
  const BlockThresholdSelector({
    required this.controller,
    super.key,
  });

  /// A [TextEditingController] for the [TextFormField] widget.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => DropDownWidget(
        initialSelection: BlockThreshold.defaultThresholdLevel,
        controller: controller,
        dropdownMenuEntries: _buildEntries(context),
      );

  List<DropdownMenuEntry<String>> _buildEntries(BuildContext context) =>
      BlockThreshold.values
          .map<DropdownMenuEntry<String>>(
            (HarmBlockThreshold threshold) => DropdownMenuEntry<String>(
              value: BlockThreshold.label(threshold),
              label: BlockThreshold.label(threshold),
              style: MenuItemButton.styleFrom(
                foregroundColor: context.theme.dividerColor,
              ),
            ),
          )
          .toList();
}
