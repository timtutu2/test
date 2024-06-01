// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DropdownDep extends StatefulWidget {
  final double? width;
  final double? height;
  final String school;
  final double textpaddle; // Add this line to accept school input

  const DropdownDep({
    super.key,
    this.width,
    this.height,
    required this.school,
    required this.textpaddle, // Make it a required parameter
  });

  @override
  State<DropdownDep> createState() => _DropdownDepState();
}

class _DropdownDepState extends State<DropdownDep> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    // This map will hold the school-to-department mapping
    final Map<String, List<String>> schoolOptions = {
      '國立清華大學': ['電機系', '資工系'],
      '國立陽明交通大學': ['醫學系', '物理治療系'],
    };

    // This will fetch the departments based on the school
    List<String> options = schoolOptions[widget.school] ?? [];

    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color(0x57636c),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Padding(
              padding: EdgeInsets.only(
                  right: widget.textpaddle), // Left padding for the hint text
              child: Text("你的系所"),
            ),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
            iconSize: 24, // Icon size
            elevation: 16,
            onChanged: (String? newValue) {
              selectedValue = newValue;
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }
}
