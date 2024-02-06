import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String username;
  final String email;

  User({required this.username, required this.email});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
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
            offset: Offset(0, 3),
        ),
      ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Edujad!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('want to start learning?',
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 30),
            Text(
              'already have an account?',
              style: TextStyle(fontSize: 13,),
            ),
            const SizedBox(height: 3),
            ElevatedButton(
              onPressed: () {
                // Navigate to the sign-in page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 15),
            Text(
              "You don't have an account",
              style: TextStyle(fontSize: 13, )
            ),
          const SizedBox(height: 3),
            ElevatedButton(
              onPressed: () {
                // Navigate to the create account page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountPage()),
                );
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    ),);
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in',
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
            offset: Offset(0, 3),
          ),
        ]),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your username and password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Add text fields for username and password here
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // For password fields
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for sign-in button
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
      ),);
  }
}

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create an Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email input field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            // Username input field
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            // Password input field
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
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
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
class UserAccountPage extends StatelessWidget {
  final String username;
  final String email;

  UserAccountPage({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Email: $email'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic for taking the test
              },
              child: Text('Take the Test'),
            ),
          ],
        ),
      ),
    );
  }
}

