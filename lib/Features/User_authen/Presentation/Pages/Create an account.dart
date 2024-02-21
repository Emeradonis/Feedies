import 'package:edujad_app/Features/User_authen/Presentation/Pages/Sign%20in.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Widgets/Form_container_widgets.dart';
import 'package:edujad_app/Global/Common/Toast.dart';
import 'package:edujad_app/firebase_auth_implement/firebase_auth_services.dart';
import 'package:edujad_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();

}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create an Account and start learning',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            FormContainerWidget(
              controller: _usernameController,
              hintText: "Username",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 12,
            ),
              FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
          ),
              const SizedBox(height: 12),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
                ), // Password input field
              const SizedBox(height: 12),
                GestureDetector(
                  onTap:  (){
                    _signUp();

                  },
                ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                builder: (context) => SignInPage()),
                  (route) => false);
                    },
                child: const Text('Sign in'),
              ),
            ],
        ),
        ),
      ),
    );
  }

  void _signUp() async {

setState(() {
    isSigningUp = true;
});

  String username = _usernameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  User? user = await _auth.signUpWithEmailAndPassword(email, password);

setState(() {
    isSigningUp = false;
});
  if (user != null) {
    showToast(message: "User is successfully created");
    Navigator.pushNamed(context, "/home");
  } else {
    showToast(message: "Some error happend");
  }
}
}

