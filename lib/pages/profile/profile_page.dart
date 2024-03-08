import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_march/pages/learn_flutter_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("/auth", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
      children: [
        const Text("Profile"),
        ElevatedButton(
          onPressed: () => logout(context),
          child: const Text("Logout"),
        )
      ],
    ));
  }
}
