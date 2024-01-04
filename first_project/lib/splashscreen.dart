import 'package:first_project/page/page_main.dart';
import 'package:first_project/src/CustomColors.dart';
import 'package:first_project/src/CustomShadow.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PageMain()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Steal A Start Flutter",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: CustomColors.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [CustomShadow.TextShadow]),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(80, 20, 80, 20),
                  child: Image.asset(
                    "assets/images/syfadil.jpg",
                    alignment: Alignment.center,
                    width: double.infinity,
                  )),
              Text(
                "By : Saia Fadil",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.overline,
                     shadows: [CustomShadow.TextShadow]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
