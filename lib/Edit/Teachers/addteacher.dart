import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzeacheck/widgetbuild/widgetbuild.dart';

class addTeacher extends StatefulWidget {
  const addTeacher({Key? key}) : super(key: key);

  @override
  _addTeacherState createState() => _addTeacherState();
}

final firestore = FirebaseFirestore.instance;
var currentUser = FirebaseAuth.instance.currentUser;

class _addTeacherState extends State<addTeacher> with TickerProviderStateMixin {
  final teaname = TextEditingController();
  final payment = TextEditingController();
  final month = TextEditingController();
  final hour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkblue,
      body: Column(children: [
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
                    Navigator.pushNamed(context, '/teamain');
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
        Padding(
          padding: EdgeInsets.only(top: size.width * 0.07),
          child: inputBuild(
              context, 'Teacher Name', teaname, 'Enter Teacher Name'),
        ),
        inputBuild(
            context, 'Payment', payment, 'Enter Teacher Payment Account'),
        Container(
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            labelStyle:
                const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "Per hour"),
              Tab(
                text: 'Per month',
              ),
            ],
          ),
        ),
        Container(
          height: size.width * 0.5,
          width: size.width * 0.9,
          child: TabBarView(
            controller: _tabController,
            children: [
              input1Build(context, '', hour, 'Salary per hour'),
              input1Build(context, '', month, 'Salary per month')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.width * 0.00),
          child: Stack(
            children: [
              white4Widget(context, size.width * 0.13, size.width * 0.5),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.025, left: size.width * 0.18),
                child: GestureDetector(
                    onTap: () {
                      if ((teaname.text == '' || payment.text == "") ||
                          (hour.text == "" && month.text == "")) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'ERROR',
                          desc: 'Please fill in all the information!',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      } else if (payment.text.length < 7) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'ERROR',
                          desc: 'The payment account is INVAILD',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        addTeacher(
                            teaname.text, payment.text, month.text, hour.text);
                      }
                    },
                    child: GestureDetector(
                        onTap: () {
                          if ((teaname.text == '' || payment.text == "") ||
                              (hour.text == "" && month.text == "")) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'ERROR',
                              desc: 'Please fill in all the information!',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else if (payment.text.length < 7) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'ERROR',
                              desc: 'The payment account is INVAILD',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            addTeacher(teaname.text, payment.text, month.text,
                                hour.text);
                          }
                        },
                        child: topic(context, 'Add', 25, darkblue))),
              )
            ],
          ),
        )
      ]),
    );
  }

  //function to add teacher
  void addTeacher(
    String teaname,
    String payment,
    String hour,
    String month,
  ) {
    firestore
        .collection('users')
        .doc(currentUser!.uid.toString())
        .collection('teachers')
        .add({
      "name": "${teaname}",
      "payment": "${payment}",
      "salaryperhour": "${hour}",
      "salarypermonth": "${month}",
    });
  }
}
