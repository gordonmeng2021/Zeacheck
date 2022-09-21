import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({Key? key}) : super(key: key);

  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
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
                        Navigator.pushNamed(context, '/mainpage');
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * 0.1, left: size.width * 0.03),
                    child: const Text(
                      'Payment',
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
                    child: Image.asset('assets/money.png'),
                  ),
                ],
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.1, bottom: size.width * 0.1),
              child: Stack(children: [
                GestureDetector(
                    onTap: () {
                      print('okok');
                    },
                    child: grey4Widget(
                        context, size.width * 0.6, size.width * 0.6)),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.24, left: size.width * 0.07),
                  child: topic(context, 'Students', 40, darkblue),
                )
              ]),
            ),
            Stack(children: [
              GestureDetector(
                  onTap: () {
                    print('okok');
                  },
                  child: orange5Widget(
                      context, size.width * 0.6, size.width * 0.6)),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.24, left: size.width * 0.07),
                child: topic(context, 'Teachers', 40, Colors.white),
              )
            ]),
            baseBar(context, 0.21)
          ],
        ));
  }
}
