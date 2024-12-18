import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/Screen/homepage.dart';
import 'package:grocery/Screen/login_page.dart';
import 'package:grocery/Screen/new_password.dart';
import 'package:grocery/Screen/reset_password.dart';
import 'package:grocery/Screen/sign_up_page.dart';
import 'package:grocery/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      // home: LoginPage(),
      routes: {
        "/": (context) => LoginPage(),
        "/sign_up": (context) => SignUpPage(),
        "/reset_password": (context) => ResetPassword(),
        "/new_password": (context) => NewPassword(),
        "/homepage": (context) => Homepage(),
      },
    );
  }
}
