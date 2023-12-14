// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<bool> deleteImagesEvent(EventsRecord eventDocument) async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (var urls in eventDocument.imgUrls) {
      await storage.ref(urls).delete();
    }
    return true;
  } catch (error) {
    print("Error removing image: $error");
    return false;
  }
}
