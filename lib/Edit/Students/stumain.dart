import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class stuMain extends StatefulWidget {
  const stuMain({Key? key}) : super(key: key);

  @override
  _stuMainState createState() => _stuMainState();
}

class _stuMainState extends State<stuMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkblue,
      body: Column(
        children: [
          Stack(children: [
            whiteWidget(context, size.width * 0.35, size.width),
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
                    'Students',
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
                  child: Image.asset('assets/student.png'),
                ),
              ],
            ),
          ]),
          Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.width * 0.18),
              child: grey2Widget(context, '/'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.3, left: size.width * 0.1),
              child: topic(context, 'Add Students', 37, darkblue),
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
                    child: black4Widget(
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
                orange3Widget(context, '/'),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.12, left: size.width * 0.085),
                  child: topic(context, 'Remove Students', 35, Colors.white),
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
