import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nepalmeds/UI/login/signin.dart';
late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp();
  auth = FirebaseAuth.instanceFor(app: app);
  runApp(NepalMeds(),

  );
}
class NepalMeds extends StatelessWidget {
  const NepalMeds({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SignInPage() ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

