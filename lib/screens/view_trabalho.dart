import 'package:flutter/material.dart';

class ViewTrabalho extends StatefulWidget {
  @override
  _ViewTrabalho createState() => _ViewTrabalho();
}

class _ViewTrabalho extends State<ViewTrabalho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("###nometralho"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            mostrarDdetalhes('##titulo'),
            //valorInfo(*produto.id.toString()*),
            espaco(),
            mostrarDdetalhes('##dataDeEntrega'),
            //valorInfo(produto.nivel),
            espaco(),
            mostrarDdetalhes('##curso'),
            //valorInfo(produto.preco.toString()),
            espaco(),
            mostrarDdetalhes('##turma'),
            //valorInfo((produto.percentualConclusao * 100).toString()),
            espaco(),
            mostrarDdetalhes('##diciplina'),
            //valorInfo(produto.biografia),
            espaco(),
            mostrarDdetalhes('##tema'),
            //valorInfo(produto.biografia),
            espaco(),
            mostrarDdetalhes('##descricao'),
            //valorInfo(produto.biografia),
            espaco(),
          ],
        ),
      ),
    );
  }

  Widget mostrarDdetalhes(String titulo) {
    return Text(
      '${titulo}:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, 1),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  SizedBox espaco() => SizedBox(
    height: 16,
  );

  Widget valorInfo(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}
