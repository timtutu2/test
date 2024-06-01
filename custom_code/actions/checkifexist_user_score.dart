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

Future<CourseScoreStruct?> checkifexistUserScore(
  List<CourseScoreStruct>? userrecord,
  DocumentReference? inputcourse,
) async {
  // Add your function code here!
  if (userrecord == null) return null;

  for (var coursescore in userrecord) {
    if (coursescore.course == inputcourse) {
      return coursescore;
    }
  }
}
