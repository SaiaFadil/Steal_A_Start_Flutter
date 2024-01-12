import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/src/CustomButton.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class page_kodeotpregister extends StatefulWidget {
  const page_kodeotpregister({super.key});

  @override
  State<page_kodeotpregister> createState() => page_kodeotpState();
}

class page_kodeotpState extends State<page_kodeotpregister> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.secondaryColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: -20,
                left: -50,
                right: -50,
                child: Image.asset("assets/images/animkodeotp.png")),
            Positioned(
                bottom: -5,
                left: -5,
                right: -5,
                child: Container(
                  height: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    elevation: 100,
                    color: CustomColors.whiteColor,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  "Kode OTP",
                                  style: CustomText.TextArvoBold(
                                      22, CustomColors.blackColor),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Silahkan masukkan kode OTP\nyang dikirim melalui email anda",
                                  style: CustomText.TextArvo(
                                      18, CustomColors.blackColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      style: CustomButton.DefaultButton(
                                          CustomColors.primaryColor),
                                      child: Text(
                                        "Konfirmasi",
                                        style: CustomText.TextArvoBold(
                                            20, CustomColors.whiteColor),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  KonfirmasiRegistrasi(),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return FadeTransition(
                                                    opacity: animation,
                                                    child: child);
                                              },
                                            ));
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class KonfirmasiRegistrasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.secondaryColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: 50,
                left: -50,
                right: -50,
                child: Image.asset("assets/images/animberhasil.png")),
            Positioned(
                bottom: -5,
                left: -5,
                right: -5,
                child: Container(
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    elevation: 100,
                    color: CustomColors.whiteColor,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Berhasil !!",
                                style: CustomText.TextArvoBold(
                                    30, CustomColors.blackColor),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Akun anda telah terdaftar.\nSilahkan masuk ke akun anda",
                                style: CustomText.TextArvo(
                                    20, CustomColors.blackColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: CustomButton.DefaultButton(
                                        CustomColors.primaryColor),
                                    child: Text(
                                      "Halaman Login",
                                      style: CustomText.TextArvo(
                                          20, CustomColors.whiteColor),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                page_login(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeTransition(
                                                  opacity: animation,
                                                  child: child);
                                            },
                                          ));
                                    },
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
