import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/presentations/presentations.dart';

/// A widget to select the the type of the model that user wants to chat with.
class ModelTypeSelector extends StatelessWidget {
  /// Constructs an instance of [ModelTypeSelector].
  const ModelTypeSelector({
    required this.controller,
    super.key,
  });

  /// A [TextEditingController] for the [TextFormField] widget.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => DropDownWidget(
        initialSelection: ModelType.defaultModel.name,
        controller: controller,
        dropdownMenuEntries: _buildEntries(context),
      );

  List<DropdownMenuEntry<String>> _buildEntries(BuildContext context) =>
      ModelType.values
          .map<DropdownMenuEntry<String>>(
            (ModelType type) => DropdownMenuEntry<String>(
              value: type.name,
              label: type.name,
              style: MenuItemButton.styleFrom(
                foregroundColor: context.theme.dividerColor,
              ),
            ),
          )
          .toList();
}
