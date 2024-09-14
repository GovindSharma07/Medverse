import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medverse/screens/home/ui/home.dart';
import 'package:medverse/screens/onBoarding/ui/login.dart';
import 'env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions android = FirebaseOptions(
      apiKey: Env.androidApiKey,
      appId: Env.androidAppId,
      messagingSenderId: Env.messagingSenderId,
      projectId: Env.projectId,
      storageBucket: Env.storageBucket);

  FirebaseOptions ios = FirebaseOptions(
      apiKey: Env.iosApiKey,
      appId: Env.iosAppId,
      messagingSenderId: Env.messagingSenderId,
      projectId: Env.projectId,
      storageBucket: Env.storageBucket,
      iosBundleId: Env.iosBundleId);
  await Firebase.initializeApp(
      options:
          (defaultTargetPlatform == TargetPlatform.android) ? android : ios);
  runApp(const Medverse());
}

class Medverse extends StatelessWidget {
  const Medverse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser == null)?const Login():const Home(),
    );
  }
}
