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
                      borderRadius:
                          BorderRadius.circular(10.0), // Set the border radius
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
                        borderRadius:
                            BorderRadius.circular(10.0), // Set the border radius
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
