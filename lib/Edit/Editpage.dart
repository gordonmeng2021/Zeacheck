import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class editPage extends StatefulWidget {
  const editPage({Key? key}) : super(key: key);

  @override
  _editPageState createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 33, 61),
      body: Column(children: [
        Stack(children: [
          orangeWidget(context, size.width * 0.35, size.width),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.1, left: size.width * 0.05),
                child: IconButton(
                  iconSize: size.width * 0.15,
                  icon: Image.asset('assets/previous.png'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/mainpage');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.width * 0.1, left: size.width * 0.13),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.width * 0.1, left: size.width * 0.07),
                height: size.width * 0.15,
                width: size.width * 0.15,
                child: Image.asset('assets/pencil.png'),
              ),
            ],
          ),
        ]),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.width * 0.18),
          child: Stack(children: [
            white2Widget(context, '/stumain'),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, left: size.width * 0.05),
              child: topic(context, 'Students', 35, darkblue),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.03, left: size.width * 0.55),
              child: Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: Image.asset('assets/student.png'),
              ),
            )
          ]),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.width * 0.1),
          child: Stack(children: [
            black2Widget(context, '/recmain'),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, left: size.width * 0.05),
              child: topic(context, 'Record', 35, Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.03, left: size.width * 0.55),
              child: Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: Image.asset('assets/money.png'),
              ),
            )
          ]),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.width * 0.1),
          child: Stack(children: [
            grey2Widget(context, '/teamain'),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, left: size.width * 0.05),
              child: topic(context, 'Teachers', 35, darkblue),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, left: size.width * 0.55),
              child: Container(
                height: size.width * 0.26,
                width: size.width * 0.26,
                child: Image.asset('assets/teacher.png'),
              ),
            )
          ]),
        ),
        baseBar(context, 0.1)
      ]),
    );
  }
}
