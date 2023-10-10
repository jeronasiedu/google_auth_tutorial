import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/controllers/user_controller.dart';
import 'package:google_auth/firebase_options.dart';
import 'package:google_auth/pages/home_page.dart';
import 'package:google_auth/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: UserController.user != null ? const HomePage() : const LoginPage(),
    );
  }
}
