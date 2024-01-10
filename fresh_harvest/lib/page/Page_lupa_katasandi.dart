import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_kodeotp.dart';
import 'package:fresh_harvest/src/CustomButton.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class page_lupa_katasandi extends StatefulWidget {
  const page_lupa_katasandi({super.key});

  @override
  State<page_lupa_katasandi> createState() => _page_lupa_katasandiState();
}

class _page_lupa_katasandiState extends State<page_lupa_katasandi> {
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
                child: Image.asset("assets/images/animlupasandi.png")),
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
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(27, 0, 27, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  "Lupa Kata Sandi ?",
                                  style: CustomText.TextArvoBold(
                                      22, CustomColors.blackColor),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Silahkan atur ulang kata sandi anda",
                                  style: CustomText.TextArvo(
                                      18, CustomColors.blackColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 45, 5, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email",
                                    style: CustomText.TextArvoBold(
                                        20, CustomColors.blackColor),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.start,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Masukkan Email Anda",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: CustomColors
                                            .primaryColor, // Warna border saat aktif
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: CustomColors
                                            .blackColor, // Warna border saat tidak aktif
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10.0),
                                    hintStyle: CustomText.TextArvo(
                                        14, CustomColors.HintColor),
                                  ),
                                  style: CustomText.TextArvo(
                                    16,
                                    CustomColors.blackColor,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 130),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      style: CustomButton.DefaultButton(
                                          CustomColors.primaryColor),
                                      child: Text(
                                        "Lanjut",
                                        style: CustomText.TextArvoBold(
                                            20, CustomColors.whiteColor),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  page_kodeotp(),
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
