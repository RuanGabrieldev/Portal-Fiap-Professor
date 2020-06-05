import 'package:flutter/material.dart';

class CadastroTrabalho extends StatefulWidget {
  @override
  _CadastroTrabalhoState createState() => _CadastroTrabalhoState();
}

class _CadastroTrabalhoState extends State<CadastroTrabalho> {
  GlobalKey<FormState> formKeyCadastro = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Cadastro de Trabalho/Prova"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 00.0),
                child: Container(
                  child: Text(
                    "Novo cadastro",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Form(
                key: formKeyCadastro,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.text_fields,
                            color: Colors.deepPurple,
                          ),
                          labelText: 'Nome da atividade',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Exemplo: Prova de flutter',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Favor informar um nome";
                          }
                          return null;
                        },
                        //adicioanando o valor para nome
                        onSaved: (value) {
                          //onde salvar
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField(
                        // Aqui estou cadastrando as opções
                        items: ["2018", "2019", "2020", "2021"]
                            .map((label) => DropdownMenuItem(
                                  //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                                  child: Text(label),
                                  //salvando o valor
                                  value: label,
                                ))
                            .toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.deepPurpleAccent,
                          ),
                          labelText: "Data de entrega",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Escolha uma das opções",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value == null) {
                            return "Favor selecionar um ano";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //deve ser salvar
                        },
                        //segue a mesma ideia do onSaved
                        onChanged: (value) {
                          //deve ser salvo
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField(
                        // Aqui estou cadastrando as opções
                        items:
                            ["Sistema de informação", "Engenharia", "Biologia"]
                                .map((label) => DropdownMenuItem(
                                      //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                                      child: Text(label),
                                      //salvando o valor
                                      value: label,
                                    ))
                                .toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.border_all,
                            color: Colors.deepPurpleAccent,
                          ),
                          labelText: "Informe o curso",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Escolha uma das opções",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value == null) {
                            return "Favor selecionar um curso";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //deve ser salvar
                        },
                        //segue a mesma ideia do onSaved
                        onChanged: (value) {
                          //deve ser salvo
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField(
                        // Aqui estou cadastrando as opções
                        items: ["3SIR", "3SIS", "3SIA", "3SIT"]
                            .map((label) => DropdownMenuItem(
                                  //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                                  child: Text(label),
                                  //salvando o valor
                                  value: label,
                                ))
                            .toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.bookmark,
                            color: Colors.deepPurpleAccent,
                          ),
                          labelText: "Informe uma turma",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Escolha uma das opções",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value == null) {
                            return "Favor selecionar uma turma";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //deve ser salvar
                        },
                        //segue a mesma ideia do onSaved
                        onChanged: (value) {
                          //deve ser salvo
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButtonFormField(
                        // Aqui estou cadastrando as opções
                        items: ["Flutter", "java", "C#"]
                            .map((label) => DropdownMenuItem(
                                  //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                                  child: Text(label),
                                  //salvando o valor
                                  value: label,
                                ))
                            .toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.book,
                            color: Colors.deepPurpleAccent,
                          ),
                          labelText: "Informe a diciplina",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Escolha uma das opções",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value == null) {
                            return "Favor selecionar uma diciplina";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //deve ser salvar
                        },
                        //segue a mesma ideia do onSaved
                        onChanged: (value) {
                          //deve ser salvo
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.border_color,
                            color: Colors.deepPurple,
                          ),
                          labelText: 'Digite o tema',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Exemplo: Nesse trabalho vamos abordar...',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          return null;
                        },
                        //adicioanando o valor para nome
                        onSaved: (value) {
                          //onde salvar
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.textsms,
                            color: Colors.deepPurple,
                          ),
                          labelText: 'Escreva uma descrição',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Exemplo: Nesse vai incluir...',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: 20.0),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Favor escrever uma descrição";
                          }
                          return null;
                        },
                        //adicioanando o valor para nome
                        onSaved: (value) {
                          //onde salvar
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 00.0),
                      child: Container(
                        height: 60.0,
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.pinkAccent,
                          child: Text(
                            "Cadastrar",
                            style:
                                TextStyle(color: Colors.white, fontSize: 19.0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
