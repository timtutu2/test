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

Future<List<NthuCoursesRecord>?> turnalldofreftodoe(
    List<DocumentReference>? inputref) async {
  // Add your function code here!
  if (inputref == null) {
    return [];
  }

  List<NthuCoursesRecord> documents = [];
  for (final ref in inputref) {
    // Assuming get() fetches the document data
    final docSnapshot = await ref.get();
    if (docSnapshot.exists) {
      // Assuming NthuCoursesRecord.fromSnapshot() parses the data into a NthuCoursesRecord
      documents.add(NthuCoursesRecord.fromSnapshot(docSnapshot));
    }
  }
  return documents;
}
