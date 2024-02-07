import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String username;
  final String email;

  User({required this.username, required this.email});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
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
              ElevatedButton(
                onPressed: () {
                  // Navigate to the create account page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                  );
                },
                child: const Text('Create Account'),
              ),
            const SizedBox(height: 15),
            const Text(
                'already have an account?',
                style: TextStyle(fontSize: 13,),
              ),
              const SizedBox(height: 3),
              ElevatedButton(
                onPressed: () {
                // Navigate to the sign-in page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
                child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    ),);
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              margin: const EdgeInsets.only(top:40, left: 20, right: 20),
              child: const TextField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // For password fields
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for sign-in button
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
      ),);
  }
}

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() {
    return _CreateAccountPageState();
  }
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          color: Colors.grey,  // Set the background color
          borderRadius: BorderRadius.circular(10),  // Set border radius
          border : Border.all(
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
        ],
    ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // Email input field
              const Text(
                'Create an Account and start learning',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top:15, left: 20, right: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              const SizedBox(height: 12),
            // Username input field
              Container(
                margin: const EdgeInsets.only(top:15, left: 20, right: 20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
              const SizedBox(height: 12),
            // Password input field
              Container(
                margin: const EdgeInsets.only(top:15, left: 20, right: 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
            ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                // Implement logic to create an account
                  final email = _emailController.text;
                  final username = _usernameController.text;
                  final password = _passwordController.text;

                // Validate input and proceed to account creation
                // You can add further validation checks here

                // Example: If all fields are non-empty, navigate to account details page
                if (email.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserAccountPage(email: email, username: username),
                    ),
                  );
                }
              },
                child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
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
          ],
        ),
      ),
    );
  }
}

