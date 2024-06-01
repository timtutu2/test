import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCCC5_YERfEiQR-9XdhVfSWQQwmyz0L7_A",
            authDomain: "connextion-test.firebaseapp.com",
            projectId: "connextion-test",
            storageBucket: "connextion-test.appspot.com",
            messagingSenderId: "790975997727",
            appId: "1:790975997727:web:ec7f5941d72310e0d1f22a"));
  } else {
    await Firebase.initializeApp();
  }
}
