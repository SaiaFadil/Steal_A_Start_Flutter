import 'package:flutter/material.dart';
import 'package:nganjuk_elok/core/page/page_login.dart';
import 'package:nganjuk_elok/res/CustomButton.dart';

class page_wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/images/anim1.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .45,
                ),
              ),
              Text(
                "SELAMAT DATANG",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  letterSpacing: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 40, 25, 10),
                child: Text(
                  "Kami Hadir untuk meningkatkan efisiensi\n dan kecepatan pelayanan kepada\n masyarakat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                child: ElevatedButton(
                    style: CustomButton.ButtonPrimary,
                    onPressed: () {
                      // Navigator.pushNamed(context, page_login.routeName);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => page_login()),
                      );
                    },
                    child: Text(
                      "Mulai ➔",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
