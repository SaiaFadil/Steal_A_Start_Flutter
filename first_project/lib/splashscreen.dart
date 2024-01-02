import 'package:first_project/page/page_main.dart';
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
      // backgroundColor: CustomColors.GreenDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "DINAS KEPEMUDAAN,OLAHRAGA,\nKEBUDAYAAN DAN PARIWISATA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "KABUPATEN NGANJUK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
