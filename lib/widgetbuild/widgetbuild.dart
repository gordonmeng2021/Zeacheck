import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Colors

const Color darkblue = Color.fromARGB(255, 20, 33, 61);
const Color Grey = Color.fromARGB(229, 229, 229, 229);
const Color Orange = Color.fromARGB(255, 252, 162, 17);

Widget whiteWidget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60)),
        color: Colors.white),
    height: height,
    width: width,
  );
}

Widget greyWidget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60)),
        color: Color.fromARGB(229, 229, 229, 229)),
    height: height,
    width: width,
  );
}

Widget orangeWidget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60)),
        color: Color.fromARGB(255, 252, 162, 17)),
    height: height,
    width: width,
  );
}

Widget blackWidget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60)),
        color: Colors.black),
    height: height,
    width: width,
  );
}

Widget orange4Widget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: Orange),
    height: height,
    width: width,
  );
}

Widget darkblueWidget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: darkblue),
    height: height,
    width: width,
  );
}

Widget white4Widget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: Colors.white),
    height: height,
    width: width,
  );
}

Widget grey4Widget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: Grey),
    height: height,
    width: width,
  );
}

Widget orange5Widget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: Orange),
    height: height,
    width: width,
  );
}

Widget black4Widget(BuildContext context, double height, double width) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
        color: Colors.black),
    height: height,
    width: width,
  );
}

Widget white2Widget(BuildContext context, String route) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
          color: Colors.white),
      height: size.width * 0.37,
      width: size.width * 0.9,
    ),
  );
}

Widget white3Widget(BuildContext context, String route) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), bottomLeft: Radius.circular(60)),
          color: Colors.white),
      height: size.width * 0.37,
      width: size.width * 0.9,
    ),
  );
}

Widget orange3Widget(BuildContext context, String route) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), bottomLeft: Radius.circular(60)),
          color: Orange),
      height: size.width * 0.37,
      width: size.width * 0.9,
    ),
  );
}

Widget black2Widget(BuildContext context, String route) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
          color: Colors.black),
      height: size.width * 0.37,
      width: size.width * 0.9,
    ),
  );
}

Widget grey2Widget(BuildContext context, String route) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60)),
            color: Color.fromARGB(229, 229, 229, 229)),
        height: size.width * 0.37,
        width: size.width * 0.9),
  );
}

Widget topic(
    BuildContext context, String string, double fontsize, Color color) {
  return Text(string,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
        color: color,
      ));
}

Widget baseBar(BuildContext context, ratio) {
  Size size = MediaQuery.of(context).size;
  return Padding(
      padding: EdgeInsets.only(top: size.width * ratio),
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

Widget inputBuild(BuildContext context, String string,
    TextEditingController controller, String hintText) {
  Size size = MediaQuery.of(context).size;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding:
            EdgeInsets.only(top: size.width * 0.05, left: size.width * 0.15),
        child: Align(
            alignment: Alignment.topLeft,
            child: topic(context, string, 19, Grey)),
      ),
      Container(
        height: size.width * 0.2,
        width: size.width * 0.8,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 2))),
        ),
      )
    ],
  );
}

Widget input1Build(BuildContext context, String string,
    TextEditingController controller, String hintText) {
  Size size = MediaQuery.of(context).size;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding:
            EdgeInsets.only(top: size.width * 0.00, left: size.width * 0.15),
        child: Align(
            alignment: Alignment.topLeft,
            child: topic(context, string, 19, Grey)),
      ),
      Container(
        height: size.width * 0.2,
        width: size.width * 0.8,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.white, width: 2))),
        ),
      )
    ],
  );
}
