import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  Color progresscolor = Orange;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: size.width * 0.43),
            child: Container(
                child: white4Widget(context, size.height * 0.9, size.width)),
          ),
          Positioned(
            right: size.width * 0.8,
            bottom: size.height * 0.8,
            child: Container(
              height: size.height * 0.25,
              width: size.height * 0.25,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: Grey),
            ),
          ),
          Positioned(
            right: size.width * 0.01,
            bottom: size.height * 0.85,
            child: Container(
              height: size.height * 0.25,
              width: size.height * 0.25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 252, 162, 17)),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.26),
                child: const Center(
                  child: Text("ZeaCheck",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 20, 33, 61),
                          fontWeight: FontWeight.bold,
                          fontSize: 50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Your payment assistant",
                          style: TextStyle(color: Orange, fontSize: 23),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Sign in to continue",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      child: Image.asset("assets/notes.png"),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.width * 0.1, bottom: size.width * 0.01),
                height: size.width * 0.2,
                width: size.width * 0.8,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Please Enter Your Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      prefixIcon: const Icon(Icons.person)),
                ),
              ),
              Container(
                height: size.width * 0.2,
                width: size.width * 0.8,
                child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Please Enter Your Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      prefixIcon: const Icon(Icons.lock),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.05, left: size.width * 0.25),
                child: Stack(children: [
                  orange4Widget(context, size.width * 0.13, size.width * 0.5),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.14, top: size.width * 0.025),
                    child: GestureDetector(
                        onTap: () async {
                          try {
                            setState(() {
                              progresscolor = Colors.white;
                            });
                            var currentUser = FirebaseAuth.instance.currentUser;
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                            Navigator.pushNamed(context, '/mainpage');
                            setState(() {
                              progresscolor = Orange;
                            });
                            //geting user UID
                            // print(currentUser!.uid.toString());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              setState(() {
                                progresscolor = Orange;
                              });
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'ERROR',
                                desc: 'Your Email Is Invaild!',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              setState(() {
                                progresscolor = Orange;
                              });
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'ERROR',
                                desc: 'Your Password Is Incorrect!',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          }
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.width * 0.02),
                              child:
                                  topic(context, 'Sign In', 25, Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.03,
                                  bottom: size.width * 0.02),
                              child: Container(
                                  height: size.width * 0.07,
                                  width: size.width * 0.07,
                                  child: CircularProgressIndicator(
                                      color: progresscolor)),
                            )
                          ],
                        )),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.08),
                child: Stack(children: [
                  darkblueWidget(context, size.width * 0.13, size.width * 0.5),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.12, top: size.width * 0.025),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerpage');
                        },
                        child: topic(context, 'Register', 25, Colors.white)),
                  )
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
