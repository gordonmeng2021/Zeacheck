import 'package:flutter/material.dart';
import 'package:newzeacheck/Edit/Teachers/addteacher.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class teaMain extends StatefulWidget {
  const teaMain({Key? key}) : super(key: key);

  @override
  _teaMainState createState() => _teaMainState();
}

class _teaMainState extends State<teaMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkblue,
      body: Column(
        children: [
          Stack(children: [
            greyWidget(context, size.width * 0.35, size.width),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.1, left: size.width * 0.05),
                  child: IconButton(
                    iconSize: size.width * 0.15,
                    icon: Image.asset('assets/previous.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/editpage');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.1, left: size.width * 0.03),
                  child: const Text(
                    'Teachers',
                    style: TextStyle(
                        color: darkblue,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.1, left: size.width * 0.07),
                  height: size.width * 0.185,
                  width: size.width * 0.185,
                  child: Image.asset('assets/teacher.png'),
                ),
              ],
            ),
          ]),
          Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.width * 0.18),
              child: black2Widget(context, '/addteapage'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.3, left: size.width * 0.1),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/addteapage');
                  },
                  child: topic(context, 'Add Teachers', 37, Colors.white)),
            )
          ]),
          Padding(
            padding: EdgeInsets.only(top: size.width * 0.1),
            child: Stack(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: orange4Widget(
                        context, size.width * 0.37, size.width * 0.8)),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.13, left: size.width * 0.11),
                  child: topic(context, "Edit Teachers", 35, Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: size.width * 0.1, left: size.width * 0.1),
            child: Stack(
              children: [
                white3Widget(context, '/'),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.12, left: size.width * 0.085),
                  child: topic(context, 'Remove Teachers', 35, darkblue),
                )
              ],
            ),
          ),
          baseBar(context, 0.1)
        ],
      ),
    );
  }
}
