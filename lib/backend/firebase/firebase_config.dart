import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDvCefQU3igdoNgdZRMrbnilak7ytm6V1I",
            authDomain: "solotavoloni.firebaseapp.com",
            projectId: "solotavoloni",
            storageBucket: "solotavoloni.appspot.com",
            messagingSenderId: "662745904914",
            appId: "1:662745904914:web:af9152f9337a446c9b25cb",
            measurementId: "G-5F3TH6HW2J"));
  } else {
    await Firebase.initializeApp();
  }
}
