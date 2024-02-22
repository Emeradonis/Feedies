
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
        child: Container(
          height: 420,
          width: 320,
          decoration: BoxDecoration(
          color: Colors.grey, // Set the background color
          borderRadius: BorderRadius.circular(10), // Set border radius
          border: Border.all(
          color: Colors.black, // Set border color
          width: 0.25, // Set border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
      ],),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Feedies!',
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: SizedBox(
                width: 285,
                child: Text('To get advice on how to improve your English, you need first to take a test',
                  style: TextStyle(
                  fontSize: 15,
              ),),
            ),),
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
                  Navigator.pushNamed(context, '/test');
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
                      Fluttertoast.showToast(msg: "Successfully signed out",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 3);
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
    ),);
  }

}

