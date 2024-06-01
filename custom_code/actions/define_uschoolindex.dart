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

Future<int> defineUschoolindex(String inputschool) async {
  // Add your function code here!
  int schoolindex;

  switch (inputschool) {
    case '國立清華大學':
      schoolindex = 1;
      break;
    case '國立陽明交通大學':
      schoolindex = 2;
      break;

    default:
      // Optionally handle the case where the school is not found or not supported.
      schoolindex = 1;
      ;
  }

  // Return num.
  return schoolindex;
}
