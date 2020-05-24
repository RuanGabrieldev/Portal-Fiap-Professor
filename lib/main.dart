import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/infos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Fiap Professor',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/infos',
      routes: {
        '/login': (context) => LoginScreen(),
        '/infos': (context) => InfosScreen(),
      },
    );
  }
}
