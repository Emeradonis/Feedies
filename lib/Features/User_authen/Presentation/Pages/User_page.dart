
import 'package:edujad_app/Global/Common/Toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserAccountPage extends StatelessWidget {
  final String username;
  final String email;

  UserAccountPage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[300],
        title: Image.asset(
          'asset/logo.png',
          width: 100, // Adjust the width as needed
          height: 60, // Adjust the height as needed
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome back $username'),
            const SizedBox(height: 20),
          SizedBox(
            child: Container(
              width: 285,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                },
                child: const Center(
                  child: Text('Take the Test',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
            const SizedBox(height: 12),
            SizedBox(
              child: Container(
                width: 285,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, "/login");
                      showToast(message: "Successfully signed out");
                  // Implement logic for taking the test
                },
                  child: const Center(
                    child: Text('Sign out',
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

