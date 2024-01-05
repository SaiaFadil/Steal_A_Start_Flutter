import 'package:flutter/material.dart';

class MulaiAplikasi extends StatefulWidget {
  const MulaiAplikasi({super.key});

  @override
  State<MulaiAplikasi> createState() => _MulaiAplikasiState();
}

class _MulaiAplikasiState extends State<MulaiAplikasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(
        child: Image.asset("assets/images/animmulai.png"),
      )),
    );
  }
}
