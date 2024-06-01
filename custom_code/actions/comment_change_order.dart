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

Future<List<DocumentReference>?> commentChangeOrder(
  List<DocumentReference>? inputCommentList,
  DocumentReference? inputComment,
) async {
  // Add your function code here!
  // Check if both the comment list and the input comment are not null
  if (inputCommentList != null && inputComment != null) {
    // Insert the input comment at the first position of the list
    inputCommentList.insert(0, inputComment);
  }

  // Return the modified list
  return inputCommentList ??
      []; // Returns an empty list if inputCommentList is null
}
