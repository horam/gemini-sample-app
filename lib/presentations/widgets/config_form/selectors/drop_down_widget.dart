import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

/// A base widget for application's dropdown.
class DropDownWidget extends StatefulWidget {
  /// Constructs an instance of [DropDownWidget].
  const DropDownWidget({
    required this.dropdownMenuEntries,
    required this.initialSelection,
    required this.controller,
    super.key,
  });

  /// A list of [DropdownMenuEntry].
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;

  /// A [TextEditingController] for the [TextFormField] widget.
  final TextEditingController controller;

  /// The [DropDownWidget]'s initial value.
  final String initialSelection;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropDownValue = '';

  @override
  void initState() {
    dropDownValue = widget.initialSelection;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => DropdownMenu<String>(
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
        dropdownMenuEntries: widget.dropdownMenuEntries,
      );

  MenuStyle _applyMenuStyle(BuildContext context) => MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          context.theme.scaffoldBackgroundColor,
        ),
      );
  void _onSelected(String? value) {
    // This is called when the user selects an item.
    setState(() {
      dropDownValue = value!;
    });
  }
}
