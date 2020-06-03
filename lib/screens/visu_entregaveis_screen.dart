import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';
import 'package:portal_fiap_professor/screens/informacoes_trab_screen.dart';

class VisuEntregaveisScreen extends StatefulWidget {
  @override
  _VisuEntregaveisScreen createState() => _VisuEntregaveisScreen();
}

class _VisuEntregaveisScreen extends State<VisuEntregaveisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
        title: Text(
          'Correções',
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FuncionalidadesScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Código",
              style: TextStyle(
                color: Color(0xFFed145b),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              "123",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Tipo de tabalho",
              style: TextStyle(
                color: Color(0xFFed145b),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              "Individual",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Trabalho",
              style: TextStyle(
                color: Color(0xFFed145b),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              "NAC 1",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Todos/ Não Avaliados / Avaliados",
              style: TextStyle(
                color: Color(0xFFed145b),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              "3 / 0 / 3",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Opções",
              style: TextStyle(
                color: Color(0xFFed145b),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new IconButton(
              icon: new Icon(Icons.edit),
              highlightColor: Colors.pink,
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformacoesTrabScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
