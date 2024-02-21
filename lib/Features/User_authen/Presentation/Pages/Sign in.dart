
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Create%20an%20account.dart';
import 'package:edujad_app/Global/Common/Toast.dart';
import 'package:edujad_app/firebase_auth_implement/firebase_auth_services.dart';
import 'package:edujad_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignInPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter your Username and Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Add text fields for username and password here
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true, // For password fields
                ),
              ),
              const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _signIn();
              },
              child: Center(
                child: _isSigning ? const CircularProgressIndicator(
                  color: Colors.white,) : const Text(
                    "Login",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: 'User is successfully signed in');
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "some error occured");
    }
  }
}

