import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

class HarmCategorySelector extends StatefulWidget {
  final TextEditingController controller;

  const HarmCategorySelector({
    super.key,
    required this.controller,
  });

  @override
  State<HarmCategorySelector> createState() => _HarmCategorySelectorState();
}

class _HarmCategorySelectorState extends State<HarmCategorySelector> {
  String dropDownValue = HarmCategoryEnum.defaultCategory;

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
      HarmCategoryEnum.values
          .map<DropdownMenuEntry<String>>(
            (HarmCategoryEnum harmCategory) => DropdownMenuEntry<String>(
              value: harmCategory.label,
              label: harmCategory.label,
              style: MenuItemButton.styleFrom(
                foregroundColor: context.theme.dividerColor,
              ),
            ),
          )
          .toList();
}
