
import 'package:edujad_app/Global/Common/Toast.dart';
import 'package:edujad_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  final String username;
  final String email;

  const UserAccountPage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Email: $email'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic for taking the test
              },
              child: const Text('Take the Test'),
            ),
             GestureDetector(
                  onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                showToast(message: "Successfully signed out");
                // Implement logic for taking the test
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}

