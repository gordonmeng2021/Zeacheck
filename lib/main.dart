import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newzeacheck/Edit/Editpage.dart';
import 'package:newzeacheck/Edit/Records/recmain.dart';
import 'package:newzeacheck/Edit/Students/stumain.dart';
import 'package:newzeacheck/Edit/Teachers/addteacher.dart';
import 'package:newzeacheck/Edit/Teachers/teamain.dart';
import 'package:newzeacheck/Payment/paymentpage.dart';
import 'package:newzeacheck/test.dart';
import 'package:newzeacheck/login/loginpage.dart';
import 'package:newzeacheck/login/register.dart';
import 'package:newzeacheck/login/successpage.dart';
import 'package:newzeacheck/login/themedite.dart';
import 'package:newzeacheck/mainpage/mainpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDefault();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          inputDecorationTheme: MyInputTheme().theme()),
      initialRoute: '/',
      routes: {
        '/': (context) => const loginPage(),
        '/loginpage': (context) => const loginPage(),
        '/registerpage': (context) => const registerPage(),
        '/succespage': (context) => const successPage(),
        '/mainpage': (context) => const mainPage(),
        '/editpage': (context) => const editPage(),
        '/teamain': (context) => const teaMain(),
        '/addteapage': (context) => const addTeacher(),
        '/stumain': (context) => const stuMain(),
        '/recmain': (context) => const recMain(),
        '/paymentpage': (context) => const paymentPage(),
        '/testpage': (context) => const testpage(),
      },
    );
  }
}

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:375962365785:ios:dc59a70b3bcd2f240c2648',
      apiKey: 'AIzaSyBcaMkoVTF1GTO54S16HW45yDRzqU10bHg',
      projectId: 'zeacheck',
      messagingSenderId: '375962365785',
    ),
  );
}
