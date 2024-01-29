import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_detail_produk.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/page/page_semua_produk.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/CustomWidget.dart';
import 'package:fresh_harvest/src/Server.dart';
import 'package:http/http.dart' as http;

class menu_home extends StatefulWidget {
  const menu_home({Key? key}) : super(key: key);
  static String kategori = "";
  static String id_produk = "";
  @override
  State<menu_home> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<menu_home> {
  bool Refresh = false;
  String jsonBuah = "{[]}";
  String jsonSayur = "{[]}";
  List<Map<String, dynamic>> listBuah = [];
  List<Map<String, dynamic>> listSayur = [];

  Future showBuah() async {
    final response = await http.get(Server.url("ShowBuah.php"));
    jsonBuah = response.body.toString();

    listBuah = List<Map<String, dynamic>>.from(json.decode(jsonBuah));
  }

  Future showSayur() async {
    final response = await http.get(Server.url("ShowSayur.php"));
    jsonSayur = response.body.toString();
    listSayur = List<Map<String, dynamic>>.from(json.decode(jsonSayur));
  }

  Widget KumpulanBuah() {
    return Container(
      height: 190,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            listBuah.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  menu_home.kategori = "buah";
                  menu_home.id_produk = listBuah[index]['id_produk'];
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  page_detail_produk(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          }));
                  print("id produk = " + menu_home.id_produk);
                },
                child: Container(
                  width: 150,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 75,
                              child: Image.asset(
                                Server.urlGambar(listBuah[index]['image']),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              listBuah[index]['nama'],
                              style: CustomText.TextArvoBold(
                                16,
                                CustomColors.blackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text(
                              listBuah[index]['jenis'],
                              style: CustomText.TextArvo(
                                10,
                                CustomColors.HintColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rp." + listBuah[index]['harga'],
                                  style: CustomText.TextArvoBold(
                                    12,
                                    CustomColors.primaryColor,
                                  ),
                                ),
                                Text(
                                  "/ " + listBuah[index]['satuan'],
                                  style: CustomText.TextArvoBold(
                                    12,
                                    CustomColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget KumpulanSayur() {
    return Container(
      height: 190,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            listBuah.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  menu_home.kategori = "sayur";
                  menu_home.id_produk = listSayur[index]['id_produk'];
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  page_detail_produk(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          }));
                  print("id produk = " + menu_home.id_produk);
                },
                child: Container(
                  width: 150,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                  height: 75,
                                  child: Image.asset(
                                    Server.urlGambar(
                                        listSayur[index]['image'] != null
                                            ? listSayur[index]['image']
                                            : "default.png"),
                                  ))),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              listSayur[index]['nama'],
                              style: CustomText.TextArvoBold(
                                  16, CustomColors.blackColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text(
                              listSayur[index]['jenis'],
                              style: CustomText.TextArvo(
                                  10, CustomColors.HintColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rp." + listSayur[index]['harga'],
                                  style: CustomText.TextArvoBold(
                                      12, CustomColors.primaryColor),
                                ),
                                Text(
                                  "/ " + listSayur[index]['satuan'],
                                  style: CustomText.TextArvoBold(
                                      12, CustomColors.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  late Timer _timer;
  @override
  void initState() {
    super.initState();
    setState(() {
      showBuah();
      showSayur();
    });
    if (!Refresh) {
      _startTimer();
      print(page_login.id_user);
      print("SUCCESSSSSSSSSSSSSSSSSS");
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      Refresh = true;
      showSayur();
      showBuah();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 100,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
                shadowColor: CustomColors.blackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                elevation: 5,
                color: CustomColors.secondaryColor,
                child: CustomWidget.KolomPencarian(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          page_login(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: CustomColors.whiteColor,
                      child: Image.asset(
                        "assets/images/posterhome.png",
                        width: double.maxFinite,
                        height: 200,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Buah Segar",
                              style: CustomText.TextArvoBold(
                                  20, CustomColors.blackColor)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          page_semua_produk(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      }));
                              setState(() {
                                menu_home.kategori = "buah";
                              });
                            },
                            child: Text("Semua",
                                style: CustomText.TextArvoBold(
                                    16, CustomColors.HintColor)),
                          )
                        ],
                      )),
                  KumpulanBuah(),
                  Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sayur Segar",
                              style: CustomText.TextArvoBold(
                                  20, CustomColors.blackColor)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          page_semua_produk(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      }));
                              setState(() {
                                menu_home.kategori = "sayur";
                              });
                            },
                            child: Text("Semua",
                                style: CustomText.TextArvoBold(
                                    16, CustomColors.HintColor)),
                          )
                        ],
                      )),
                  KumpulanSayur(),
                ],
              ),
            ),
          )
        ])));
  }
}
