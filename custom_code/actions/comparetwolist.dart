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

Future<List<DocumentReference>?> comparetwolist(
  List<DocumentReference>? oricouse,
  List<DocumentReference>? newcourse,
) async {
  // Check for null lists and return null or an empty list accordingly.
  if (oricouse == null) return null;
  if (newcourse == null) return oricouse;

  // Create an empty list to hold the results.
  List<DocumentReference> result = [];

  // Use a Set for efficient lookups.
  Set<String> newCourseIds = newcourse.map((docRef) => docRef.id).toSet();

  // Iterate over the original list and add items not in the new list to the result.
  for (var docRef in oricouse) {
    if (!newCourseIds.contains(docRef.id)) {
      result.add(docRef);
    }
  }

  // Return the result.
  return result;
  // Add your function code here!
}
