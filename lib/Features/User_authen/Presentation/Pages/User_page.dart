
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void navigateToUserProfile(BuildContext context, String userId) {
  Navigator.pushNamed(context, '/profile/$userId');
}
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
            Text('Welcome to Feedies $username!',
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            const SizedBox(height: 5),
            //StreamBuilder<List<UserModel>>(
              //  stream: _readData(username),
                //builder: (context, snapshot) {
                 // if(snapshot.connectionState == ConnectionState.waiting){
                   // return Center(child: CircularProgressIndicator(),);
                  //}
                  //if (snapshot.hasError) {
                    //return Center(child: Text("Error: ${snapshot.error}"));
                  //}
                  //if(snapshot.data == null || snapshot.data!.isEmpty){
                    //return Center(child:Text("No Data Yet"));
                  //}
                 // final users = snapshot.data;
      // return Padding(padding: EdgeInsets.all(8),
    // child: Column(
            // children: users!.map((user) {
      // return ListTile(
    // leading: GestureDetector(
    // onTap: (){
    // _deleteData(user.id!);},child: Icon(Icons.delete),
      //),
    // trailing: GestureDetector(onTap: (){_updateData(
    // UserModel(
    // id: user.id,
    // username: "John Wick",
      // adress: "Pakistan",));
    // },
    // child: Icon(Icons.update),
      // ),title: Text(user.username ?? ''),
      // subtitle: Text(user.adress ?? ''),);
    // }).toList()
    // ),);}),
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

Stream<List<UserModel>> _readData(String username) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  return userCollection.where('username', isEqualTo: username).snapshots().map((querySnapshot) =>
      querySnapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList());
}

void _createData(UserModel userModel) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  String id = userCollection.doc().id;

  final newUser = UserModel(
    username: userModel.username,
    age: userModel.age,
    adress: userModel.adress,
    id: id,
  ).toJson();

  userCollection.doc(id).set(newUser);
}

void _updateData(UserModel userModel) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  final newData = UserModel(
    username: userModel.username,
    id: userModel.id,
    adress: userModel.adress,
    age: userModel.age,
  ).toJson();

  userCollection.doc(userModel.id).update(newData);

}

void _deleteData(String id) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  userCollection.doc(id).delete();

}



class UserModel{
  final String? username;
  final String? adress;
  final int? age;
  final String? id;

  UserModel({this.id,this.username, this.adress, this.age});


  static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return UserModel(
      username: snapshot['username'],
      age: snapshot['age'],
      id: snapshot['id'],
      adress: snapshot['adress'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "username": username,
      "age": age,
      "id": id,
      "adress": adress,
    };
  }
}

