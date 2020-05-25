import 'package:flutter/material.dart';

import 'package:portal_fiap_professor/screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 20, 91, 1)
      ),
      routes: {
        "/" : (context) => LoginScreen(),
      },
      initialRoute: "/",
    )
  );
}