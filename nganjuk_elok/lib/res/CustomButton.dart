
import 'package:flutter/material.dart';

class CustomButton{
   static ButtonStyle ButtonPrimary = TextButton.styleFrom(
    backgroundColor: Color.fromRGBO(12, 57, 36, 1),
    padding: EdgeInsets.symmetric(horizontal: 10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    minimumSize: Size(double.infinity, 50),
  );
}