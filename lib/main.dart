import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/" : (context) => LoginScreen(),
      },
      initialRoute: "/",
    )
  );
}