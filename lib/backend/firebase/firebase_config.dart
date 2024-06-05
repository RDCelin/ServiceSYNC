import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDQXZFeZgcAoUItclnyBS16XZys8bGrN4o",
            authDomain: "manejo-soporte-c3769.firebaseapp.com",
            projectId: "manejo-soporte-c3769",
            storageBucket: "manejo-soporte-c3769.appspot.com",
            messagingSenderId: "912493918664",
            appId: "1:912493918664:web:fcf9768355cbbc7a5ae8fd"));
  } else {
    await Firebase.initializeApp();
  }
}
