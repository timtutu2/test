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

import 'dart:math' as math;

Future<int> noRepeatInt(List<DocumentReference> inputdocRef) async {
  // Add your function code here!
  // Extract chat_of_post_ID from each document in inputDocRef
  const int minID = 10000;
  const int maxID = 10000000 - minID;

  math.Random random = math.Random();
  List<int> existingIds = [];
  for (var doc in inputdocRef) {
    var data = await doc.get(); // Get the document data
    int id = data[
        'chat_of_post_ID']; // Replace with the actual field key if different
    existingIds.add(id);
  }

  // Generate a unique number
  int uniqueId = random.nextInt(maxID);
  ;

  while (existingIds.contains(uniqueId)) {
    uniqueId = random.nextInt(maxID) + minID;
  }

  // Return the unique number
  return uniqueId;
}
