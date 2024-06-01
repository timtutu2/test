// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flex_color_picker/flex_color_picker.dart';

Future<Color> flutterColorpac(BuildContext context, Color currentColor) async {
  Color cancelColor = currentColor;
  Color selectedColor = currentColor;

  // Show the color picker dialog.
  await showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            color: selectedColor,
            onColorChanged: (Color color) {
              selectedColor = color;
            },
            pickersEnabled: const <ColorPickerType, bool>{
              ColorPickerType.both: true,
              ColorPickerType.primary: false,
              ColorPickerType.accent: false,
              ColorPickerType.bw: false,
              ColorPickerType.custom: false,
              ColorPickerType.wheel: true,
              // Set to false all other picker types that you don't want to show.
            },
            enableShadesSelection: true,
            showColorName: true,
            showColorCode: true,
            copyPasteBehavior: const ColorPickerCopyPasteBehavior(
              longPressMenu: true,
            ),
            actionButtons: const ColorPickerActionButtons(
              okButton: false,
              closeButton: false,
              dialogActionButtons: false,
            ),
            colorCodeHasColor: true,
            colorCodeReadOnly: false,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          TextButton(
            child: const Text('SELECT'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(selectedColor);
            },
          ),
        ],
      );
    },
  );

  // It's important to use the currentColor if the selectedColor did not change.
  return selectedColor != currentColor ? selectedColor : cancelColor;
}
