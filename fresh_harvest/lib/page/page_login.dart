import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/model/DataDiri.dart';
import 'package:fresh_harvest/controller/controller_login.dart';

class page_login extends StatefulWidget {
  @override
  State<page_login> createState() => _page_login();
}

class _page_login extends State<page_login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  DataDiri profil = DataDiri();
  bool isObscured = true;
  bool isHovered = true;
  @override
  void initState() {
    super.initState();
    profil.name = 'Saia Fadi';
    profil.email = 'fadillahwahyunugraha@gmail.com';
    profil.password = 'admin123';
    profil.address = 'Nganjuk, Jatim';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.whiteColor,
        body: Stack(
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
              bottom: -5,
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
                  // Card content here
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
                          child: Text('Email',
                              textAlign: TextAlign.left,
                              style: CustomText.TextArvoBold(
                                  16, CustomColors.blackColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
                          child: TextField(
                              controller: controller_login.emailController,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.start,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  hintText: "Masukkan Email Anda",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                      color: CustomColors
                                          .primaryColor, // Warna border saat aktif
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                      color: CustomColors
                                          .HintColor, // Warna border saat tidak aktif
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10.0),
                                  hintStyle: CustomText.TextArvo(
                                      14, CustomColors.HintColor)),
                              style: CustomText.TextArvo(
                                  16, CustomColors.blackColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Text('Kata Sandi',
                              textAlign: TextAlign.left,
                              style: CustomText.TextArvoBold(
                                  16, CustomColors.blackColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: TextField(
                            controller: controller_login.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textAlign: TextAlign.start,
                            textInputAction: TextInputAction.next,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              hintText: "Masukkan Kata Sandi Anda",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: isHovered ? Colors.black : Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: CustomColors
                                      .primaryColor, // Warna border saat aktif
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: CustomColors
                                      .HintColor, // Warna border saat tidak aktif
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
                                iconSize: 30,
                              ),
                            ),
                            style: CustomText.TextArvo(
                                16, CustomColors.blackColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Lupa Kata Sandi",
                                  style: CustomText.TextArvoItalic(
                                      16, CustomColors.blackColor)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                                elevation:
                                    MaterialStateProperty.all<double>(100),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.fromLTRB(70, 15, 70, 15)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        CustomColors.primaryColor),
                              ),
                              onPressed: () {},
                              child: Text("Masuk",
                                  style: CustomText.TextArvoBold(
                                      20, CustomColors.whiteColor)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  height: 1,
                                  color: CustomColors.blackColor,
                                ),
                              ),
                              Text('atau',
                                  style: CustomText.TextArvo(
                                      16, CustomColors.blackColor)),
                              Expanded(
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors
                                  .whiteColor, // Warna latar belakang tombol
                              onPrimary: CustomColors.blackColor, // Warna teks
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
            Padding(
              padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
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
    );
  }
}
