import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_harvest/menu/menu_home.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/Server.dart';
import 'package:http/http.dart' as http;

class page_detail_produk extends StatefulWidget {
  const page_detail_produk({super.key});

  @override
  State<page_detail_produk> createState() => _page_detail_produkState();
}

class _page_detail_produkState extends State<page_detail_produk> {
  String Judul = "", kategori = "",harga ="",stok="";
  
  String jsonDetail = """{
    "Judul" : "Tidak Ditemukan",
  }""";
  Map<String, dynamic> listData = {};
  
  Future ShowDetail() async {
    final response = await http.post(Server.url("ShowDetailProduk.php"),
        body: {"id_produk": menu_home.id_produk});

    setState(() {
      jsonDetail = response.body.toString();
      listData = Map<String, dynamic>.from(json.decode(jsonDetail));
       harga = listData['harga'];
       stok = listData['stok']+" "+listData['satuan'];
    });

    kategori = menu_home.kategori;
    if (kategori == "buah") {
      Judul = "Buah";
    } else if (kategori == "sayur") {
      Judul = "Sayur";
    }
  }
  
  @override
  void initState() {
    super.initState();
    ShowDetail();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(color: CustomColors.primaryColor),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 30,
                                      color: CustomColors.whiteColor,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Detail " + Judul,
                                  style: CustomText.TextArvoBold(
                                      25, CustomColors.whiteColor),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                            child: Text(
                              listData['jenis']??"...",
                              style: CustomText.TextArvoBold(
                                30,
                                CustomColors.blackColor,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 565,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 5, 20),
                              child: Container(
                                  height: 130,
                                  width: 150,
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Rp."+harga,
                                                style: CustomText.TextArvoBold(
                                                    20,
                                                    CustomColors.primaryColor),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  "Harga yang tertera diatas\nmerupakan harga / Kg buah.",
                                                  style:
                                                      CustomText.TextArvoBold(
                                                          9,
                                                          CustomColors
                                                              .primaryColor),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 50, 0, 20),
                              child: Container(
                                  height: 130,
                                  width: 220,
                                  child: Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Stok",
                                                    style: CustomText.TextArvo(
                                                        11.5,
                                                        CustomColors
                                                            .primaryColor),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "Masa Penyimpanan",
                                                      style: CustomText.TextArvo(
                                                          11,
                                                          CustomColors
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "Dikirim dari",
                                                      style: CustomText.TextArvo(
                                                          11,
                                                          CustomColors
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        ":",
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        ":",
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        ":",
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        stok??"null",
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "1 Minggu",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Bandung",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomText
                                                            .TextArvoBold(
                                                                12,
                                                                CustomColors
                                                                    .primaryColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 15,
                                                child: Icon(
                                                  Icons.error,
                                                  color:
                                                      CustomColors.primaryColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6, left: 3),
                                                child: Text(
                                                  "Sebaiknya disimpan dilemari\nes / kulkas.",
                                                  style:
                                                      CustomText.TextArvoBold(
                                                          10,
                                                          CustomColors
                                                              .primaryColor),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            color: CustomColors.HintColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ambil di toko bebas biaya kirim !",
                            style: CustomText.TextArvo(
                                13, CustomColors.blackColor),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: CustomColors.HintColor,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                              child: Text(
                                "Ongkos kirim",
                                style: CustomText.TextArvoBold(
                                    14, CustomColors.blackColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                " Rp. 7000",
                                style: CustomText.TextArvo(
                                    14, CustomColors.redColor),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                          child: Text(
                            "Anda akan mendapatkan gratis ongkir dengan minimal",
                            style: CustomText.TextArvo(
                                13, CustomColors.blackColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 0, 10),
                          child: Text(
                            "belanja Rp. 120.000",
                            style: CustomText.TextArvo(
                                13, CustomColors.blackColor),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: CustomColors.HintColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            height: 65,
                            width: 400,
                            color: CustomColors.whiteColor,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              color: CustomColors.primaryColor,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/ic_message.png")),
                                        Text(
                                          "Chat\nPenjual",
                                          style: CustomText.TextArvoBold(
                                              16, CustomColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    right: -4,
                                    top: -4,
                                    bottom: -4,
                                    child: Container(
                                      height: 65,
                                      width: 120,
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: CustomColors.whiteColor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                height: 55,
                                                width: 55,
                                                child: Image.asset(
                                                    "assets/images/nav_shop.png")),
                                            Text(
                                              "Masukkan\nKeranjang",
                                              style: CustomText.TextArvoBold(16,
                                                  CustomColors.primaryColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
              top: 170,
              left: 160,
              right: 0,
              child: Container(
                height: 150,
                width: 150,
                child: Image.asset(
  Server.urlGambar(listData['image'] != null ? listData['image'] : "default.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
