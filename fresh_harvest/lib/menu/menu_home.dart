import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class menu_home extends StatefulWidget {
  const menu_home({super.key});

  @override
  State<menu_home> createState() => _menu_homeState();
}

class _menu_homeState extends State<menu_home> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(body: Center(
        child: Text("Home",style: CustomText.TextChewyBold(40, CustomColors.blackColor,)),
      ),),
    );
  }
}