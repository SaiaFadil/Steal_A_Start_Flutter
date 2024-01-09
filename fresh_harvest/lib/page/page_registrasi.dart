import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class page_registrasi extends StatefulWidget {
  const page_registrasi({super.key});

  @override
  State<page_registrasi> createState() => _page_registrasiState();
}

class _page_registrasiState extends State<page_registrasi> {
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
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/bgregister.png")),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 145,
                child: Container(
                  height: 800,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    elevation: 100,
                    color: CustomColors.whiteColor,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Daftarkan Akun Anda",
                              style: CustomText.TextArvoBold(
                                  24, CustomColors.blackColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Silahkan lengkapi data berikut",
                              style: CustomText.TextArvo(
                                  16, CustomColors.blackColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nama Lengkap",
                                  style: CustomText.TextArvoBold(
                                      22, CustomColors.blackColor),
                                ),
                              ),
                              Container(
                                height: 60,
                                padding: EdgeInsets.only(top: 10),
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Masukkan Nama Anda",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(
                                        color: CustomColors.primaryColor
                                      )
                                    )
                                  )),
                                
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                               
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                           
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                             
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                    
                              ),
                            ]),
                          )
                        ],
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
