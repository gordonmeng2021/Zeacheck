import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class successPage extends StatefulWidget {
  const successPage({Key? key}) : super(key: key);

  @override
  _successPageState createState() => _successPageState();
}

class _successPageState extends State<successPage> {
  final _myController = TextEditingController();

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

          // Container(
          //     margin: EdgeInsets.only(top: size.height * 0.2),
          //     child: whiteWidget(
          //         context, size.height * 0.8, MediaQuery.of(context).size.width)),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.4),
                child: const Center(
                  child: Text("Registeration",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 20, 33, 61),
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Row(children: [
                  Container(
                      height: size.width * 0.2,
                      width: size.width * 0.2,
                      child: Image.asset('assets/check-mark.png')),
                  topic(context, 'Successfully', 40,
                      const Color.fromARGB(255, 37, 184, 96))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.1),
                child: topic(context, 'Thankyou', 20, Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.03),
                child: topic(context, 'Enjoy Zeacheck!', 17, Grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * 0.12),
                child: Stack(children: [
                  darkblueWidget(context, size.width * 0.13, size.width * 0.65),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1, top: size.width * 0.025),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/loginpage');
                        },
                        child: topic(
                            context, 'Back to Sign In', 25, Colors.white)),
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
