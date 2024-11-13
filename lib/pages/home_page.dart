import 'package:flutter/material.dart';
import 'package:flutter_signin/controller/user_controller.dart';
import 'package:flutter_signin/pages/login_page.dart';

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
              radius: 40,
              foregroundImage: UserController.user?.photoURL != null 
                  ? NetworkImage(UserController.user!.photoURL!)
                  : null,
              child: UserController.user?.photoURL == null 
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            Text(UserController.user?.displayName ?? 'GuestUser'),
             Text(UserController.user?.email ?? 'Email'),
             
            ElevatedButton(
              onPressed: () async {
                await UserController.signOut();
                if (mounted) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                }
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
