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

Future<List<NthuCoursesRecord>> covertDocRefsToDocs(
    List<DocumentReference>? nthucourseRefs) async {
  // Return an empty list if nthucourseRefs is null or empty
  if (nthucourseRefs == null || nthucourseRefs.isEmpty) {
    return [];
  }

  // Fetch all documents concurrently based on their references
  final docsFutures = nthucourseRefs.map((docRef) => docRef.get()).toList();

  // Wait for all futures to complete
  final docsSnapshots = await Future.wait(docsFutures);

  // Convert each DocumentSnapshot to NthuCoursesRecord
  // Ensure the fromSnapshot method exists and is correctly implemented in NthuCoursesRecord
  final docs = docsSnapshots
      .where((snapshot) => snapshot.exists) // Ensure the document exists
      .map((snapshot) => NthuCoursesRecord.fromSnapshot(snapshot))
      .whereType<
          NthuCoursesRecord>() // Ensure only NthuCoursesRecord are returned
      .toList();

  return docs;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
