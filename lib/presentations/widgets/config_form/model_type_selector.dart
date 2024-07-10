import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

class ModelTypeSelector extends StatefulWidget {
  final TextEditingController controller;

  const ModelTypeSelector({
    super.key,
    required this.controller,
  });

  @override
  State<ModelTypeSelector> createState() => _ModelTypeSelectorState();
}

class _ModelTypeSelectorState extends State<ModelTypeSelector> {
  String dropDownValue = ModelType.defaultModel;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropDownValue,
      controller: widget.controller,
      enableSearch: false,
      width: MediaQuery.of(context).size.width - 32,
      label: Text(dropDownValue),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      menuStyle: _applyMenuStyle(context),
      selectedTrailingIcon: const Icon(Icons.arrow_drop_down),
      onSelected: _onSelected,
      dropdownMenuEntries: _buildEntries(context),
    );
  }

  MenuStyle _applyMenuStyle(BuildContext context) => MenuStyle(
        backgroundColor:
            WidgetStateProperty.all(context.theme.scaffoldBackgroundColor),
      );

  void _onSelected(String? value) {
    // This is called when the user selects an item.
    setState(() {
      dropDownValue = value!;
    });
  }

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
