// import 'dart:html';

import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:fresh_harvest/navigation/utama.dart';
import 'package:fresh_harvest/page/Page_lupa_katasandi.dart';
import 'package:fresh_harvest/page/page_registrasi.dart';
import 'package:fresh_harvest/src/CustomButton.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/Server.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class page_login extends StatefulWidget {
  @override
  State<page_login> createState() => _page_login();
}

class _page_login extends State<page_login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<List> _ceklogin() async {
    final response = await http.post(Uri.parse(Server.url("Login.php")), body: {
      "email": emailController.text,
      "password": passwordController.text
    });

    print(response.body);
    var datauser = json.decode(response.body);
    if (datauser['kode'] == 2) {
      setState(() {
        isWrong = true;
      });
      print("username or password is wrong!!");
    } else if (datauser['kode'] == 1) {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => utama(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
      print("Login berhasil");
    }
    return [];
  }
  bool isObscured = true;
  bool isHovered = true;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isWrong = false;


  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        isEmailFocused = false;
        isPasswordFocused = false;
        FocusScope.of(context).unfocus();

        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: CustomColors.whiteColor,
          body: GestureDetector(
            onTap: () {
              setState(() {
                isEmailFocused = false;
                isPasswordFocused = false;
                FocusScope.of(context).unfocus();
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.6),
                      colors: [
                        CustomColors.primaryColor,
                        CustomColors.secondaryColor
                      ],
                      stops: [0.5, 1.9],
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/TextJudul.png",
                    alignment: Alignment.topCenter,
                    width: double.maxFinite,
                  ),
                ),
                Positioned(
                  bottom: isEmailFocused || isPasswordFocused ? 0 : 0,
                  left: -3,
                  right: -3,
                  child: Container(
                    height: 500,
                    child: Card(
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 85, 30, 10),
                                child: Visibility(
                                  visible: isWrong,
                                  child: Text('Username atau password salah!',
                                      textAlign: TextAlign.left,
                                      style: CustomText.TextArvoBold(
                                          16, CustomColors.redColor)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text('Email',
                                  textAlign: TextAlign.left,
                                  style: CustomText.TextArvoBold(
                                      20, CustomColors.blackColor)),
                            ),
                            Container(
                              height: 55,
                              padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
                              child: TextField(
                                controller: emailController,
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
                                focusNode: emailFocusNode,
                                onTap: () {
                                  setState(() {
                                    emailFocusNode.requestFocus();
                                    isEmailFocused = true;
                                    isPasswordFocused = false;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text('Kata Sandi',
                                  textAlign: TextAlign.left,
                                  style: CustomText.TextArvoBold(
                                      20, CustomColors.blackColor)),
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                              child: TextField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.next,
                                obscureText: isObscured,
                                decoration: InputDecoration(
                                  hintText: "Masukkan Kata Sandi Anda",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: isPasswordFocused
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
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
                                focusNode: passwordFocusNode,
                                onTap: () {
                                  setState(() {
                                    passwordFocusNode.requestFocus();
                                    isPasswordFocused = true;
                                    isEmailFocused = false;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: ((context, animation,
                                                  secondaryAnimation) =>
                                              page_lupa_katasandi()),
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
                                  child: Text("Lupa Kata Sandi",
                                      style: CustomText.TextArvoItalic(
                                          16, CustomColors.blackColor)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: CustomButton.DefaultButton(
                                      CustomColors.primaryColor),
                                  onPressed: () {
                                    _ceklogin();
                                    print("Login presseedd");
                                  },
                                  child: Text("Masuk",
                                      style: CustomText.TextArvoBold(
                                          20, CustomColors.whiteColor)),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Belum Punya Akun?',
                                        style: CustomText.TextArvo(
                                            16, CustomColors.blackColor)),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  page_registrasi(),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: child,
                                                );
                                              },
                                            ));
                                      },
                                      child: Text("Daftar Disini",
                                          style: CustomText.TextArvoBold(
                                              16, CustomColors.redColor)),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      height: 1,
                                      color: CustomColors.blackColor,
                                    ),
                                  ),
                                  Text('atau',
                                      style: CustomText.TextArvo(
                                          16, CustomColors.blackColor)),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 25),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: CustomColors
                                      .whiteColor, // Warna latar belakang tombol
                                  onPrimary:
                                      CustomColors.blackColor, // Warna teks
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icons8-google-480.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Masuk dengan akun Google',
                                      style: CustomText.TextArvo(
                                          14, CustomColors.blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1200),
                  curve: Curves.elasticIn,
                  top: isEmailFocused || isPasswordFocused ? -100 : 200,
                  left: 30,
                  right: 30,
                  child: Image.asset(
                    "assets/images/animlogin.png",
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
