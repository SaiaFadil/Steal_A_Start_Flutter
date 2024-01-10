import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_atur_ulang_sandi.dart';
import 'package:fresh_harvest/src/CustomButton.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';


class page_kodeotp extends StatefulWidget {
  const page_kodeotp({super.key});

  @override
  State<page_kodeotp> createState() => page_kodeotpState();
}

class page_kodeotpState extends State<page_kodeotp> {
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
                                                  page_atur_ulang_sandi(),
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