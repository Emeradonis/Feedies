import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class rec extends StatefulWidget {
  const rec({super.key});

  @override
  State<rec> createState() => _testState();
}

class _testState extends State<rec> {
  AudioPlayer audioPlayer = AudioPlayer();


  void pickFile() async {
    String? filePath = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav'],
    ).then((value) => value!.files.single.path);

    if (filePath != null) {
      playAudio(filePath);
    }
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
                  'Sit tight!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'The second part',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 285,
                  child: Text('In the second part you would have to record yourself talking for no more than 45 seconds. It is advisable not to read from an already witten text. Be comfortable and and sit in quiet place, so that the system could hear you loud and clear. Record yourself Now',
                      style: TextStyle(fontSize: 15)
                  ),
                ),
                const SizedBox(height: 45),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: pickFile,
                      child: Container( // Add a Container here
                        width: 140,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: <Widget>[
                            SizedBox(width: 5),
                            Icon(Icons.attach_file, color: Colors.black),
                            SizedBox(width: 10),
                            Text('Upload a File',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // On hold = start recording
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left:8),
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.mic, color: Colors.black, size: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/test');
                      },
                      style: ElevatedButton.styleFrom(fixedSize: const Size(127, 30)),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  void playAudio(String filePath) async {
    int result = await audioPlayer.play(filePath, isLocal: true);
    if (result == 1) {
      print('Audio playing');
    }
  }
}
