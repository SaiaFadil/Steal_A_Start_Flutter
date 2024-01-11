import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class menu_shop extends StatefulWidget {
  const menu_shop({super.key});

  @override
  State<menu_shop> createState() => _menu_shopState();
}

class _menu_shopState extends State<menu_shop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(
        child: Text("SHOP",style: CustomText.TextChewyBold(40, CustomColors.blackColor,)),
      ),),
    );
  }
}