import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/curso_selecao_screen.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';

import 'package:portal_fiap_professor/screens/login_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';
import 'package:portal_fiap_professor/screens/turmas_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(237, 20, 91, 1)
      ),
      routes: {
        "/" : (context) => LoginScreen(),
        "/cursos": (context) => CursoSelecaoScreen(),
        "/infos": (context) => TurmasScreen(),
        "/periodo": (context) => SiPeriodosScreen(),
        "/funcionalidades": (context) => FuncionalidadesScreen(),
      },
      initialRoute: "/",
    )
  );
}
