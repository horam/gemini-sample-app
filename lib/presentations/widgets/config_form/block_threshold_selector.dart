import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

class BlockThresholdSelector extends StatefulWidget {
  final TextEditingController controller;

  const BlockThresholdSelector({
    super.key,
    required this.controller,
  });

  @override
  State<BlockThresholdSelector> createState() => _BlockThresholdSelectorState();
}

class _BlockThresholdSelectorState extends State<BlockThresholdSelector> {
  String dropDownValue = BlockThreshold.defaultThresholdLevel;

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
      BlockThreshold.values
          .map<DropdownMenuEntry<String>>(
            (BlockThreshold threshold) => DropdownMenuEntry<String>(
              value: threshold.label,
              label: threshold.label,
              style: MenuItemButton.styleFrom(
                foregroundColor: context.theme.dividerColor,
              ),
            ),
          )
          .toList();
}
