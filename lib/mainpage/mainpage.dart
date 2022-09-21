import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 20, 33, 61),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, left: size.width * 0.03),
                child: const Text('Welcome Back!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
              ),
              Divider(
                color: Colors.white,
                height: size.width * 0.1,
              ),
              Container(
                  margin: EdgeInsets.only(right: size.width * 0.5),
                  child: Text(
                      DateFormat('dd-MM-yyyy kk:mm').format(DateTime.now()),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic))),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.23, bottom: size.width * 0.15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editpage');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 20, 33, 61)),
                  child: Stack(
                    children: [
                      orange4Widget(
                          context, size.width * 0.45, size.width * 0.9),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.1, top: size.width * 0.05),
                        child: const Text("Edit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.55, top: size.width * 0.1),
                        child: Container(
                            height: size.width * 0.2,
                            width: size.width * 0.2,
                            child: Image.asset('assets/pencil.png')),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 20, 33, 61)),
                onPressed: () {
                  Navigator.pushNamed(context, '/paymentpage');
                },
                child: Stack(
                  children: [
                    white4Widget(context, size.width * 0.45, size.width * 0.9),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.1, top: size.width * 0.05),
                      child: const Text("Payment",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 20, 33, 61),
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.55, top: size.width * 0.1),
                      child: Container(
                          height: size.width * 0.23,
                          width: size.width * 0.2,
                          child: Image.asset('assets/money.png')),
                    )
                  ],
                ),
              ),
              baseBar1(context)
            ],
          )),
    );
  }
}

Widget baseBar1(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
      padding: EdgeInsets.only(top: size.height * 0.13),
      child: Stack(children: [
        white4Widget(context, size.width * 0.17, size.width),
        Padding(
          padding: EdgeInsets.only(top: size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Image.asset('assets/menu.png'),
                onPressed: () {
                  Navigator.pushNamed(context, '/mainpage');
                },
              ),
              IconButton(
                icon: Image.asset('assets/exit.png'),
                onPressed: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Sign Out',
                      desc: 'Are you sure you want to sign out?',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, '/loginpage');
                      }).show();
                },
              )
            ],
          ),
        )
      ]));
}
