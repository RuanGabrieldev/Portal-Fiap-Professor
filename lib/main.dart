import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/turma_repository.dart';

import 'package:portal_fiap_professor/screens/login_screen.dart';
import 'package:portal_fiap_professor/screens/teste_screen.dart';

void main() {


  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 20, 91, 1)
      ),
      routes: {
        "/" : (context) => LoginScreen(),
        "/teste" : (context) => TesteScreen(),
      },
      initialRoute: "/",
    )
  );
}