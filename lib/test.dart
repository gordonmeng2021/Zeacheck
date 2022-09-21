import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

final firestore = FirebaseFirestore.instance;
var currentUser = FirebaseAuth.instance.currentUser;

final db = FirebaseFirestore.instance;

final washingtonRef = db.collection("cities").doc();

class testpage extends StatefulWidget {
  const testpage({Key? key}) : super(key: key);

  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  late final String name;
  late final int age;

  void addUser() {
    firestore.collection('users').add({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    });
  }

  addUser1() {
    print('hello');
    return FutureBuilder<DocumentSnapshot>(
      // future: users.doc('tISwOwmtcTNeDWP1y3dv6tzp9HA3').get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('hello inside');
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          print('hello inside');
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print('hello inside');
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text('auth test')),
          ),
          TextField(
            controller: controller,
          ),

          // return Text('${data.docs['name']}');
        ],
      ),
    );
  }
}
