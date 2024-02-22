
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Signup.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Widgets/Form_container_widgets.dart';
import 'package:edujad_app/Global/Common/Toast.dart';
import 'package:edujad_app/firebase_auth_implement/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignInPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              SizedBox(
                width: 285,
                height: 45,
                child: FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 285,
                height: 45,
                child: FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
              ),
              const SizedBox(height: 20),
            SizedBox(
              width: 285,
              height: 45,
              child: GestureDetector(
                onTap: () {
                  _signIn();
                },
                child: Container(
                  width: 285,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                ),
                  child: Center(
                    child: _isSigning ? const CircularProgressIndicator(
                    color: Colors.white,) : const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ),
            SizedBox(height: 9,),
            GestureDetector(
              onTap: () {
                _signInWithGoogle();

              },
              child: Container(
                width: 285,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
              SizedBox(height: 8,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                            (route) => false,
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
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
      Fluttertoast.showToast(msg: 'Successfully signed in',
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 3);
      Navigator.pushNamed(context, "/user");
    } else {
      Fluttertoast.showToast(msg: "Incorrect Email or Password ",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 3);
    }
  }
  _signInWithGoogle() async{

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if(googleSignInAccount != null ){
        final GoogleSignInAuthentication googleSignInAuthentication = await
        googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }

    }
    catch(e) {
      Fluttertoast.showToast(msg: "some error occured $e",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 3);
    }


  }


}

