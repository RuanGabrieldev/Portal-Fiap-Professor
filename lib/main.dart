import 'package:flutter/material.dart';

import 'package:portal_fiap_professor/screens/login_screen.dart';
import 'package:portal_fiap_professor/screens/teste_screen.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';
import 'package:portal_fiap_professor/screens/curso_screen.dart';
import 'package:portal_fiap_professor/screens/turma_screen.dart';

void main() {


  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 20, 91, 1)
      ),
      routes: {
        "/" : (context) => LoginScreen(),
        "/teste" : (context) => TesteScreen(),
        "/cursos": (context) => CursoSelecaoScreen(),
        "/turmas": (context) => TurmasScreen(),
        "/periodo": (context) => SiPeriodosScreen(),
        "/funcionalidades": (context) => FuncionalidadesScreen(),
      },
      initialRoute: "/",
    )
  );
}
