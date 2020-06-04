import 'dart:js';

import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/cadastro_trabalho.dart';

import 'package:portal_fiap_professor/screens/login_screen.dart';
import 'package:portal_fiap_professor/screens/teste_screen.dart';
import 'package:portal_fiap_professor/screens/curso_selecao_screen.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';
import 'package:portal_fiap_professor/screens/turmas_screen.dart';
import 'package:portal_fiap_professor/screens/pesquisa_trabalho_screen.dart';
import 'package:portal_fiap_professor/screens/view_trabalho.dart';

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
        "/infos": (context) => TurmasScreen(),
        "/periodo": (context) => SiPeriodosScreen(),
        "/funcionalidades": (context) => FuncionalidadesScreen(),
        "/entregaTrabalho": (context) => TelaEntreTrabalho(),
        "/viewTrabalho": (context) => ViewAtividade(),
        "/viewTrabalho": (context) => CadastroTrabalho()

      },
      initialRoute: "/",
    )
  );
}
