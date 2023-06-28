// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

Future saveImage(String imgPath) async {
  try {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(imgPath);
    if (imageId == null) {
      return;
    }

    // Below is a method of obtaining saved image information.
    var fileName = await ImageDownloader.findName(imageId);
    var path = await ImageDownloader.findPath(imageId);
    var size = await ImageDownloader.findByteSize(imageId);
    var mimeType = await ImageDownloader.findMimeType(imageId);
  } on PlatformException catch (error) {
    print(error);
  }
}
