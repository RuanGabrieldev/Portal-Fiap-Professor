import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesquisaTrabalhoScreen extends StatefulWidget {
  @override
  _PesquisaTrabalhoScreen createState() => _PesquisaTrabalhoScreen();
}

class _PesquisaTrabalhoScreen extends State<PesquisaTrabalhoScreen> {
  final codigo = TextEditingController();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

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
                  // child: Container(
                  //   child: Text(
                  //     "Welcome Flavio",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 25.0,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
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
                      color: Colors.green,
                      child: Text(
                        "Cadastrar novo trabalho",
                        style: TextStyle(color: Colors.white, fontSize: 19.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: Text(
                    "Pesquisar trabalho",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextField(
                          controller: codigo,
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
                              Icons.code,
                              color: Colors.deepPurple,
                            ),
                            labelText: 'Digite o codigo',
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Exemplo: 01234',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, fontSize: 20.0),
                          // validator: (codigo) {
                          //   if(int.parse(codigo) == null){
                          //     return "o Campo Código não pode ser null";
                          //   }
                          //   if (int.parse(codigo) < 0) {
                          //     return "Não pode ser numero negativo";
                          //   }
                          //   return null;
                          // },
                          //adicioanando o valor para nome
                          // onSaved: (value) {
                          //   //onde salvar
                          // },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40.0),
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
                            labelText: "Informe o ano",
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
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 40.0),
                      //   child: DropdownButtonFormField(
                      //     // Aqui estou cadastrando as opções
                      //     items: [
                      //       "Sistema de informação",
                      //       "Engenharia",
                      //       "Biologia"
                      //     ]
                      //         .map((label) => DropdownMenuItem(
                      //               //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                      //               child: Text(label),
                      //               //salvando o valor
                      //               value: label,
                      //             ))
                      //         .toList(),
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(30.0)),
                      //         borderSide: BorderSide(color: Colors.white),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(30.0)),
                      //         borderSide:
                      //             BorderSide(color: Colors.white, width: 2.0),
                      //       ),
                      //       icon: Icon(
                      //         Icons.border_all,
                      //         color: Colors.deepPurpleAccent,
                      //       ),
                      //       labelText: "Informe o curso",
                      //       labelStyle: TextStyle(color: Colors.white),
                      //       hintText: "Escolha uma das opções",
                      //       hintStyle: TextStyle(color: Colors.white),
                      //     ),
                      //     style: TextStyle(
                      //         color: Colors.deepPurpleAccent, fontSize: 20.0),
                      //     validator: (value) {
                      //       if (value == null) {
                      //         return "Favor selecionar um curso";
                      //       }
                      //       return null;
                      //     },
                      //     onSaved: (value) {
                      //       //deve ser salvar
                      //     },
                      //     //segue a mesma ideia do onSaved
                      //     onChanged: (value) {
                      //       //deve ser salvo
                      //     },
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 40.0),
                      //   child: DropdownButtonFormField(
                      //     // Aqui estou cadastrando as opções
                      //     items: ["3SIR", "3SIS", "3SIA", "3SIT"]
                      //         .map((label) => DropdownMenuItem(
                      //               //Coloamos a linha a baixo para montar o corpo e mostrar o texto de umas das opções
                      //               child: Text(label),
                      //               //salvando o valor
                      //               value: label,
                      //             ))
                      //         .toList(),
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(30.0)),
                      //         borderSide: BorderSide(color: Colors.white),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(30.0)),
                      //         borderSide:
                      //             BorderSide(color: Colors.white, width: 2.0),
                      //       ),
                      //       icon: Icon(
                      //         Icons.bookmark,
                      //         color: Colors.deepPurpleAccent,
                      //       ),
                      //       labelText: "Informe uma turma",
                      //       labelStyle: TextStyle(color: Colors.white),
                      //       hintText: "Escolha uma das opções",
                      //       hintStyle: TextStyle(color: Colors.white),
                      //     ),
                      //     style: TextStyle(
                      //         color: Colors.deepPurpleAccent, fontSize: 20.0),
                      //     validator: (value) {
                      //       if (value == null) {
                      //         return "Favor selecionar uma turma";
                      //       }
                      //       return null;
                      //     },
                      //     onSaved: (value) {
                      //       //deve ser salvar
                      //     },
                      //     //segue a mesma ideia do onSaved
                      //     onChanged: (value) {
                      //       //deve ser salvo
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40.0),
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
                        padding: EdgeInsets.only(bottom: 30.0),
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
                            hintText:
                                'Exemplo: Nesse trabalho vamos abordar...',
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
                              "Pesquisar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.0),
                            ),
                            onPressed: () {
                              if (codigo.text == '') {
                                _showAlertDialog(context);
                              } else {
                                _settingModalBottomSheet(context);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

void _showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Campo obrigatório"),
    content: Text("É preciso inserir um valor para código"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: new Wrap(
          children: <Widget>[
            new ListTile(
                leading: new Icon(
                  Icons.chevron_right,
                ),
                title: new Text(
                  'NAC 1',
                ),
                onTap: () => {}),
            new ListTile(
              leading: new Icon(Icons.videocam),
              title: new Text('Video'),
              onTap: () => {},
            ),
          ],
        ),
      );
    },
  );
}
