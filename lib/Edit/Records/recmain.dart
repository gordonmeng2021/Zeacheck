import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class recMain extends StatefulWidget {
  const recMain({Key? key}) : super(key: key);

  @override
  _recMainState createState() => _recMainState();
}

class _recMainState extends State<recMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkblue,
      body: Column(
        children: [
          Stack(children: [
            blackWidget(context, size.width * 0.35, size.width),
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
                    'Record',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.width * 0.1, left: size.width * 0.07),
                  height: size.width * 0.185,
                  width: size.width * 0.185,
                  child: Image.asset('assets/money.png'),
                ),
              ],
            ),
          ]),
          baseBar(context, 0.1)
        ],
      ),
    );
  }
}
