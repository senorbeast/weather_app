import 'package:flutter/material.dart';

class DropdownSelector extends StatefulWidget {
  final List<String> dropDownOptions;
  final ValueChanged<String> valueChanged;

  const DropdownSelector({
    required this.dropDownOptions,
    required this.valueChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownSelector> createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropDownOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
          });
          widget.valueChanged(value);
        }
      },
      items:
          widget.dropDownOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value, // Ensure each value is unique
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
