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

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

Future downloadimage(
  String url,
  String filename,
) async {
  try {
    // Requesting the data from the url
    final response = await http.get(Uri.parse(url));

    if (response.headers['content-type']?.startsWith('image/') ?? false) {
      // It's an image, proceed with saving the file
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$filename');
      await file.writeAsBytes(response.bodyBytes);
      // Continue with your code to save the image to the gallery
    } else {
      // The response is not an image
      throw Exception('The URL did not point to an image.');
    }

    // Getting the application's documents directory path
    final directory = await getApplicationDocumentsDirectory();

    // The file to write to within the directory
    final file = File('${directory.path}/$filename');

    // Writing the file
    await file.writeAsBytes(response.bodyBytes);

    // If you want to store the file in the gallery, you would use a plugin like `gallery_saver`
    await GallerySaver.saveImage(file.path, albumName: 'YourAlbumName');

    // Inform the user about the success
    print('Photo downloaded to ${file.path}');
  } catch (e) {
    // Handle the error
    print('Error downloading photo: $e');
  }
}
