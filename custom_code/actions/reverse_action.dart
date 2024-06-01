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

Future<List<PostWithTimeStruct>?> reverseAction(
    List<PostWithTimeStruct> tempPostWithTime) async {
  // Sort the list in reverse order by the addTime field
  tempPostWithTime.sort((a, b) {
    // Treat null as the earliest date for sorting purposes
    var aTime = a.addTime ?? DateTime.now();

    var bTime = b.addTime ?? DateTime.now();
    return bTime.compareTo(aTime);
  });

  // Return the sorted list
  return tempPostWithTime;
}
