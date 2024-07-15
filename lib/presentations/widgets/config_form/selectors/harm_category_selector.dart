import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/presentations/presentations.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// A widget to receives's users's preference for harm category,
class HarmCategorySelector extends StatelessWidget {
  /// Constructs an instance of [HarmCategorySelector].
  const HarmCategorySelector({
    required this.controller,
    super.key,
  });

  /// A [TextEditingController] for the [TextFormField] widget.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => DropDownWidget(
        initialSelection: HarmType.defaultCategory,
        controller: controller,
        dropdownMenuEntries: _buildEntries(context),
      );

  List<DropdownMenuEntry<String>> _buildEntries(BuildContext context) =>
      HarmType.values
          .map<DropdownMenuEntry<String>>(
            (HarmCategory type) => DropdownMenuEntry<String>(
              value: HarmType.label(type),
              label: HarmType.label(type),
              style: MenuItemButton.styleFrom(
                foregroundColor: context.theme.dividerColor,
              ),
            ),
          )
          .toList();
}
