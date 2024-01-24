import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fresh_harvest/menu/menu_home.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';
import 'package:fresh_harvest/src/CustomWidget.dart';
import 'package:fresh_harvest/src/Server.dart';
import 'package:http/http.dart' as http;

class page_semua_produk extends StatefulWidget {
  const page_semua_produk({Key? key}) : super(key: key);

  @override
  _PageSemuaProdukState createState() => _PageSemuaProdukState();
}

class _PageSemuaProdukState extends State<page_semua_produk> {
  String kategori = menu_home.kategori;
  String Judul = "";
  String jsonBuah = "[]"; // Corrected initialization
  List<Map<String, dynamic>> listBuah = [];
  int itemHorizontal = 1;
  Future<void> showBuah() async {
    final response = await http.post(Server.url("ShowSemuaProduk.php"),body: 
    {
      "kategori": menu_home.kategori
    }
    );
    setState(() {
      jsonBuah = response.body;
      listBuah = List<Map<String, dynamic>>.from(json.decode(jsonBuah));
    });
    if(kategori == "buah"){
      Judul = "Buah";
    }else if(kategori == "sayur"){
      Judul = "Sayur";
    }
     print("kategori : "+Judul);
  }

  @override
  void initState() {
    super.initState();
    showBuah();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          Positioned(
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
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
                    child: CustomWidget.KolomPencarian(() {}),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: CustomColors.primaryColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          Judul,
                          style: CustomText.TextArvoBold(
                              25, CustomColors.primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 160,
            right: 0,
            left: 0,
            bottom: 0,
            child: GridView.builder(
              itemCount: listBuah.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    elevation: 8,color: CustomColors.whiteColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: double.infinity,
                          child: Image.asset(
                            Server.urlGambar(listBuah[index]['image']),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          listBuah[index]['nama'],
                          style: CustomText.TextArvoBold(
                            16,
                            CustomColors.blackColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          listBuah[index]['jenis'],
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.HintColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp. ${listBuah[index]['harga']}",
                                style: CustomText.TextArvoBold(
                                  14,
                                  CustomColors.primaryColor,
                                ),
                              ),
                              Text(
                                "/ ${listBuah[0]['satuan']}",
                                style: CustomText.TextArvoBold(
                                  14,
                                  CustomColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ])));
  }
}
