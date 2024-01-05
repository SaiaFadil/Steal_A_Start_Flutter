import 'package:flutter/material.dart';

class controller_login {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static bool obscureText = true; 

  static void togglePasswordVisibility() {
    obscureText = !obscureText;
  }
}
