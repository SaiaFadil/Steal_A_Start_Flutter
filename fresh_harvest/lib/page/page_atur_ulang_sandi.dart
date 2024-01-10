import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/src/CustomButton.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class page_atur_ulang_sandi extends StatefulWidget {
  const page_atur_ulang_sandi({super.key});

  @override
  State<page_atur_ulang_sandi> createState() => _page_atur_ulang_sandiState();
}

class _page_atur_ulang_sandiState extends State<page_atur_ulang_sandi> {
  bool isObscured = true;
  bool konfisObscured = true;
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
                top: -100,
                left: -50,
                right: -50,
                child: Image.asset("assets/images/animaturulanglupa.png")),
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
                                  "Atur Ulang Kata Sandi",
                                  style: CustomText.TextArvoBold(
                                      24, CustomColors.blackColor),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Silahkan masukkan kata sandi baru",
                                  style: CustomText.TextArvo(
                                      18, CustomColors.blackColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                               Padding(
                                  padding: EdgeInsets.fromLTRB(5, 50, 5, 0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Kata Sandi',
                                        textAlign: TextAlign.left,
                                        style: CustomText.TextArvoBold(
                                            20, CustomColors.blackColor)),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.start,
                                    textInputAction: TextInputAction.next,
                                    obscureText: isObscured,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan Kata Sandi Anda",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: CustomColors
                                              .primaryColor, // Warna border saat aktif
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: CustomColors
                                              .blackColor, // Warna border saat tidak aktif
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10.0),
                                      hintStyle: CustomText.TextArvo(
                                          14, CustomColors.HintColor),
                                      suffixIcon: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          setState(() {
                                            isObscured = !isObscured;
                                          });
                                        },
                                        icon: Icon(
                                          isObscured
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                        iconSize: 25,
                                      ),
                                    ),
                                    style: CustomText.TextArvo(
                                      16,
                                      CustomColors.blackColor,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Konfirmasi Kata Sandi',
                                        textAlign: TextAlign.left,
                                        style: CustomText.TextArvoBold(
                                            20, CustomColors.blackColor)),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.start,
                                    textInputAction: TextInputAction.next,
                                    obscureText: konfisObscured,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Masukkan Ulang Kata Sandi Anda",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: CustomColors
                                              .primaryColor, // Warna border saat aktif
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: CustomColors
                                              .blackColor, // Warna border saat tidak aktif
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10.0),
                                      hintStyle: CustomText.TextArvo(
                                          14, CustomColors.HintColor),
                                      suffixIcon: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          setState(() {
                                            konfisObscured = !konfisObscured;
                                          });
                                        },
                                        icon: Icon(
                                          konfisObscured
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                        iconSize: 25,
                                      ),
                                    ),
                                    style: CustomText.TextArvo(
                                      16,
                                      CustomColors.blackColor,
                                    ),
                                    onTap: () {},
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
                                        "Ubah",
                                        style: CustomText.TextArvoBold(
                                            20, CustomColors.whiteColor),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  KonfirmasiAturUlang(),
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

class KonfirmasiAturUlang extends StatelessWidget {
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
                                "Kata sandi anda berhasil di ubah\nSilahkan masuk ke akun anda",
                                style: CustomText.TextArvo(
                                    20, CustomColors.blackColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 60),
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
