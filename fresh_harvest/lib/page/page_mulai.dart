import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class MulaiAplikasi extends StatefulWidget {
  @override
  State<MulaiAplikasi> createState() => _MulaiAplikasiState();
}

class _MulaiAplikasiState extends State<MulaiAplikasi> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        return false; 
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/animmulai.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 430,
                left: 15,
                right: 15,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('GAYA HIDUP SEHAT',
                          style: CustomText.TextChewyBold(
                              28, CustomColors.blackColor)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 30, 20),
                      child: Text(
                        "Dengan Selalu Konsumsi\nBuah dan Sayuran Segar",
                        textAlign: TextAlign.center,
                        style:
                            CustomText.TextArvoBold(20, CustomColors.blackColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => page_login(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            transitionDuration: Duration(milliseconds: 1000),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/tombolmulai.png",
                        // atur ukuran gambar sesuai kebutuhan
                        width: 250,
                        height: 150,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
