import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIZfLA9XJHTmb73l0jmx2azgIPd5GScno",
            authDomain: "flicks-da809.firebaseapp.com",
            projectId: "flicks-da809",
            storageBucket: "flicks-da809.appspot.com",
            messagingSenderId: "346801684314",
            appId: "1:346801684314:web:6dcbdf11995b998f123d63"));
  } else {
    await Firebase.initializeApp();
  }
}
