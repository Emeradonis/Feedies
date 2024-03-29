
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Rec.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Rec2.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Signin.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Signup.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/Test.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/User_page.dart';
import 'package:edujad_app/Features/User_authen/Presentation/Pages/feed.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey: "AIzaSyB5OQR_tJh3eb-ACcAxxgxEyvty0EZy7ok",
            appId: "1:112371686236:web:4829b191704875fce87f99",
            messagingSenderId: "112371686236",
            projectId: "feedies",),
    );
  }

  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedies',
      routes: {
        '/': (context) => SignInPage(),
        '/home': (context) => FirstPage(),
        '/login': (context) => SignInPage(),
        '/signUp': (context) => CreateAccountPage(),
        '/user': (context) => UserAccountPage(username: '', email: '',),
        '/test': (context) => test(),
        '/rec' : (context) => rec(),
        '/rec2' : (context) => rec2(),
        '/feed' : (context) => feed(username: '', email: ''),
      },
    );
  }
}


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
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
            color: Colors.grey,  // Set the background color
            borderRadius: BorderRadius.circular(10),  // Set border radius
            border: Border.all(
              color: Colors.black,  // Set border color
              width: 0.25,  // Set border width
            ),
              boxShadow: [
                BoxShadow(
          color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
        ),
      ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to Edujad!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
              const Text('want to start learning?',
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  // Navigate to the sign-in page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateAccountPage()),);
                },
                child: Container(
                  width: 285,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Create an account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 15),
            const Text(
                'already have an account?',
                style: TextStyle(fontSize: 13.5,
                fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),

              GestureDetector(
                  onTap: () {
                // Navigate to the sign-in page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),);
              },
                child: Container(
                  width: 285,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: const Center(
                  child: Text('Sign In',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),
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

}





