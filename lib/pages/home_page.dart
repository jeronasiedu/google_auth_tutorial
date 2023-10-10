import 'package:flutter/material.dart';
import 'package:google_auth/pages/login_page.dart';

import '../controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage:
                  NetworkImage(UserController.user?.photoURL ?? ''),
            ),
            Text(UserController.user?.displayName ?? ''),
            ElevatedButton(
                onPressed: () async {
                  await UserController.signOut();
                  if (mounted) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  }
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
