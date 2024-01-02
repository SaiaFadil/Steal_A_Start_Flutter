import 'package:flutter/material.dart';
import 'package:nganjuk_elok/core/controller/controller_login.dart';
import 'package:nganjuk_elok/core/page/page_wellcome.dart';
import 'package:nganjuk_elok/model/DataDiri.dart';
import 'package:nganjuk_elok/res/CustomButton.dart';
import 'package:nganjuk_elok/res/CustomColors.dart';

class page_login extends StatefulWidget {
  static const String routeName = "/PageLogin";

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<page_login> {
  // Inisialisasi variabel profil di dalam class State
  DataDiri profil = DataDiri();

  @override
  void initState() {
    // Inisialisasi nilai profil di initState
    super.initState();
    profil.name = 'Saia Fadi';
    profil.email = 'fadillahwahyunugraha@gmail.com';
    profil.password = 'admin123';
    profil.address = 'Nganjuk, Jatim';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CustomColors.GreenDark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  'Selamat Datang di\nNGANJUK ELOK',
                  style: TextStyle(
                      color: CustomColors.GreenDark,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/logodisporabudpar.png',
                width: double.infinity,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: TextField(
                  controller: controller_login.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    labelText: 'Masukkan Emailmu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.GreenDark),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 16, color: CustomColors.GreenDark),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: controller_login.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          controller_login.togglePasswordVisibility();
                        });
                      },
                      icon: Icon(
                        controller_login.obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye_sharp,
                        color: CustomColors.GreenDark,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    labelText: 'Masukkan Kata Sandi',
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.GreenDark),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 16, color: CustomColors.GreenDark),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: ElevatedButton(
                  style: CustomButton.ButtonPrimary,
                  onPressed: () {
                    // Ambil nilai dari TextField
                    String email = controller_login.emailController.text;
                    String password = controller_login.passwordController.text;

                    // Pengecekan apakah inputan kosong atau tidak
                    if (email.isEmpty || password.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Inputan Kosong',
                              textScaleFactor: 1,
                            ),
                            content: Text(
                              'Mohon isi email dan password',
                              textScaleFactor: 1,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Pengecekan email dan password
                      if (email == profil.email &&
                          password == profil.password) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Login Berhasil',
                                textScaleFactor: 1,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                page_wellcome()));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Login Gagal',
                                textScaleFactor: 1,
                              ),
                              content: Text(
                                'Email atau password salah',
                                textScaleFactor: 1,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
