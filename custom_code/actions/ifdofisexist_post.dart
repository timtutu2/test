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

Future<bool> ifdofisexistPost(DocumentReference inputpost) async {
  // Add your function code here!
  try {
    // Try to get the document at the specified reference
    var doc = await inputpost.get();

    // Return true if the document exists, false if not
    return doc.exists;
  } catch (e) {
    // Handle the error, maybe log it or set a state variable
    print(e); // for debugging purposes
    return false; // Assume the document does not exist if an error occurs
  }
}
