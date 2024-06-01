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

Future<NthuCoursesRecord?> finditemiDocsaction(
  List<NthuCoursesRecord>? docslist,
  String timeString,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Checks if the document list is null and returns null early if true.
  // This avoids throwing an exception and adheres to Flutter/Dart best practices.
  if (docslist == null) return null;

  // Iterates over each document in the list.
  for (NthuCoursesRecord doc in docslist) {
    // Checks if the current document's time list contains the timeString.
    if (doc.time.contains(timeString)) {
      // Returns the document immediately if a match is found.
      return doc;
    }
  }

  // Returns null if no matching document is found.
  // This is a subtle way to handle "not found" cases, allowing the caller to check for null.
  return null;
  // Add your function code here!
}
