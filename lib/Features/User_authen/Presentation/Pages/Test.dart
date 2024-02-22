import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
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
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Start the test NOW!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'The first part',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 285,
                child: Text('The test has two parts. The first one is a form that you need to fill, which will have some questions of some information about you which will be used for research purposes. You can fill the form Now',
                    style: TextStyle(fontSize: 15)
                ),
              ),
              const SizedBox(height: 45),
              GestureDetector(
                onTap: () {
                  // Navigate to the sign-in page
                  Navigator.pushNamed(
                    context, '/user');
                },
                child: Container(
                  width: 285,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Fill the form',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/user');
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(127, 30)),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/rec');
                          // Add your onPressed function here
                        },
                        style: ElevatedButton.styleFrom(fixedSize: const Size(127, 30)),
                          label: const Text('Next'),
                          icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
              ),
                ],
              )
        ),
      ),
    );
  }
}
