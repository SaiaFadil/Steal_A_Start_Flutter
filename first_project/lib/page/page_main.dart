import 'dart:async';
import 'package:first_project/splashscreen.dart';
import 'package:flutter/material.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState()=> _PageMainState();
}
class _PageMainState extends State<PageMain>{
@override
void initState(){
  super.initState();

  Timer(Duration(milliseconds: 4500), () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SplashScreen(),));
   });
}
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("Fadil F nya Flangter")),//opsional
    body: Center(child: Column(
      
    )
    ),
  );
}

}