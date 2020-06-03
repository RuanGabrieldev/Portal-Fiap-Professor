import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/visu_entregaveis_screen.dart';

class InformacoesTrabScreen extends StatefulWidget {
  @override
  _InformacoesTrabScreen createState() => _InformacoesTrabScreen();
}

class _InformacoesTrabScreen extends State<InformacoesTrabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: Color(0xFFed145b)),
          title: Text(
            'Informações do trabalho',
            style: TextStyle(
              color: Color(0xFFed145b),
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VisuEntregaveisScreen()),
              );
            },
          ),
        ),
        body: null);
  }
}
