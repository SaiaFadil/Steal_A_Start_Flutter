import 'package:flutter/material.dart';
import 'package:fresh_harvest/src/CustomColors.dart';
import 'package:fresh_harvest/src/CustomText.dart';

class menu_profile extends StatefulWidget {
  const menu_profile({super.key});

  @override
  State<menu_profile> createState() => _menu_profileState();
}

class _menu_profileState extends State<menu_profile> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(
        child: Text("Profile",style: CustomText.TextChewyBold(40, CustomColors.blackColor,)),
      ),),
    );
  }
}