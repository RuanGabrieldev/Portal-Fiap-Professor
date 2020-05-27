import 'package:flutter/material.dart';

import 'package:portal_fiap_professor/screens/infos_si_screen.dart';
import 'package:portal_fiap_professor/screens/login_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 20, 91, 1)
      ),
      routes: {
        "/" : (context) => LoginScreen(),
        '/infos': (context) => InfosSiScreen(),
        '/periodo':(context) => SiPeriodosScreen(),
      },
      initialRoute: "/infos",
    )
  );
}
