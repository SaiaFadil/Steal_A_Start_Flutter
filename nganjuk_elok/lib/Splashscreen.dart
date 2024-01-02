import 'package:flutter/material.dart';
import 'dart:async';
import 'package:nganjuk_elok/core/page/page_wellcome.dart';
import 'package:nganjuk_elok/res/CustomColors.dart';

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
        MaterialPageRoute(builder: (BuildContext context) => page_wellcome()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.GreenDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logodisporabudpar.png',
              width: 150,
              height: 150,
            ),
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
