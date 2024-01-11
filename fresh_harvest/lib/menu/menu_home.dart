import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/CustomWidget.dart';

class menu_home extends StatefulWidget {
  const menu_home({super.key});

  @override
  State<menu_home> createState() => _menu_homeState();
}

class _menu_homeState extends State<menu_home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
              shadowColor: CustomColors.blackColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 5,
              color: CustomColors.secondaryColor,
              child: CustomWidget.KolomPencarian((){Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation)=>page_login(),transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation,child: child,);
              },));})
            ),
          ),
          SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 0,
                  color: CustomColors.whiteColor,
                  child: Image.asset("assets/images/posterhome.png"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Buah Segar",
                          style: CustomText.TextArvoBold(
                              20, CustomColors.blackColor)),
                      Text("Semua",
                          style:
                              CustomText.TextArvo(18, CustomColors.HintColor)),
                    ],
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sayur Segar",
                          style: CustomText.TextArvoBold(
                              20, CustomColors.blackColor)),
                      Text("Semua",
                          style:
                              CustomText.TextArvo(18, CustomColors.HintColor)),
                    ],
                  )),
            ],
          ))
        ],
      )),
    );
  }
}
