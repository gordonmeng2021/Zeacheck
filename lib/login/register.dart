import 'package:firebase_auth/firebase_auth.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  Color orgColor = Colors.grey;

  late String email;
  late String password;
  late String confirmpassword;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  void register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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

        // Container(
        //     margin: EdgeInsets.only(top: size.height * 0.2),
        //     child: whiteWidget(
        //         context, size.height * 0.8, MediaQuery.of(context).size.width)),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.26),
              child: const Center(
                child: Text("Register",
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
                        "Please Register Your New Account",
                        style: TextStyle(color: Orange, fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Register to continue",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.width * 0.1, bottom: size.width * 0.01),
              height: size.width * 0.2,
              width: size.width * 0.8,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    focusColor: darkblue,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Please Enter Your Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    prefixIcon: const Icon(Icons.lock),
                  )),
            ),
            Container(
              height: size.width * 0.2,
              width: size.width * 0.8,
              child: TextFormField(
                  controller: _confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Your Password',
                    labelText: 'Confirm Your Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 10),
                        borderRadius: BorderRadius.circular(40)),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.05),
              child: Stack(children: [
                darkblueWidget(context, size.width * 0.13, size.width * 0.5),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.12, top: size.width * 0.025),
                  child: GestureDetector(
                      onTap: () {
                        if (_confirmpasswordController.text ==
                                _passwordController.text &&
                            _emailController.text != '' &&
                            _passwordController.text != '' &&
                            _confirmpasswordController.text != '') {
                          email = _emailController.text;
                          password = _passwordController.text;
                          register();
                          Navigator.pushNamed(context, '/succespage');
                        } else if (_emailController.text == '' ||
                            _emailController.text.length < 4) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'ERROR',
                            desc: 'Your Email Is Invaild!',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        } else if (_passwordController.text.length < 4 ||
                            _confirmpasswordController.text.length < 4) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'ERROR',
                            desc: 'Your Password Is Too Short!',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        } else if (_passwordController.text.length !=
                            _confirmpasswordController.text.length) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'ERROR',
                            desc: 'Your Password Is Not The Same!',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                      child: topic(context, 'Register', 25, Colors.white)),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.05),
              child: Stack(children: [
                grey4Widget(context, size.width * 0.13, size.width * 0.65),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.09, top: size.width * 0.025),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      child: topic(context, 'Back to Sign In', 25, darkblue)),
                )
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
