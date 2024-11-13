import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin/controller/user_controller.dart';
import 'package:flutter_signin/firebase_options.dart';
import 'package:flutter_signin/pages/home_page.dart';
import 'package:flutter_signin/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: UserController.user != null ? const HomePage() : const LoginPage(),
    );
  }
}

