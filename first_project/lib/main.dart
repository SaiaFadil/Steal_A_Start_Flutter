import 'package:first_project/splashscreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => NamaClassmu(),//Class yang pertama di eksekusi ketika aplikasi di jalankan
      },
    );
  }
}