import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_harvest/page/page_detail_profil.dart';
import 'package:fresh_harvest/page/page_login.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/Server.dart';
import 'package:http/http.dart' as http;

class menu_profile extends StatefulWidget {
  const menu_profile({super.key});

  @override
  State<menu_profile> createState() => _menu_profileState();
}

class _menu_profileState extends State<menu_profile> {
  String profil = "", nama = "", email = "", alamat = "";
  String jsonProfil = "{}";
  Map<String, dynamic> listProfil = {};

  Future getDetailProfil() async {
    final response = await http.post(Server.url("ShowDetailProfil.php"),
        body: {"id_user": page_login.id_user});
    setState(() {
      jsonProfil = response.body.toString();
      listProfil = Map<String, dynamic>.from(json.decode(jsonProfil));
      nama = listProfil['nama'];
      email = listProfil['email'];
      alamat = listProfil['alamat'];
      print(response.body);
      profil = Server.urlGambar(listProfil['foto']);});
  }

  @override
  void initState() {
    super.initState();
    getDetailProfil();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    color: CustomColors.whiteColor,
                    elevation: 5,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: CustomColors
                            .primaryColor, // Set the color of the border
                        width: 2, // Set the width of the border
                      ),
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the border /////////////////////////////////////////radius
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          PageDetailProfil(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6 -
                                            7,
                                    height:
                                        MediaQuery.of(context).size.width / 6 -
                                            7,
                                    child: ClipOval(
                                      child: Image.asset(
                                        profil != null ? profil : "default.png",
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: Text(
                                            nama,
                                            style: CustomText.TextArvoBold(
                                                16, CustomColors.blackColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: Text(
                                            email,
                                            style: CustomText.TextArvo(
                                                12, CustomColors.blackColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                        Server.urlGambar("ic_proses.png")),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Proses",
                                        style: CustomText.TextArvo(
                                            10, CustomColors.blackColor),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        Server.urlGambar("ic_dikemas.png")),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "DIkemas",
                                        style: CustomText.TextArvo(
                                            10, CustomColors.blackColor),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        Server.urlGambar("ic_diambil.png")),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Diambil",
                                        style: CustomText.TextArvo(
                                            10, CustomColors.blackColor),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                        Server.urlGambar("ic_selesai.png")),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Selesai",
                                        style: CustomText.TextArvo(
                                            10, CustomColors.blackColor),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      color: CustomColors.primaryColor,
                      elevation: 5,
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: CustomColors
                              .primaryColor, // Set the color of the border
                          width: 2, // Set the width of the border
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Alamat Toko",
                                  style: CustomText.TextArvoBold(
                                      18, CustomColors.blackColor),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: CustomColors.secondaryColor,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(alamat,
                                        style: CustomText.TextArvo(
                                            12, CustomColors.blackColor)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                    width: double.infinity,
                                    height: 90,
                                    color: CustomColors.secondaryColor,
                                    child: Image.asset(
                                      Server.urlGambar("maps.png"),
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ]),
                      ),
                    ),
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
