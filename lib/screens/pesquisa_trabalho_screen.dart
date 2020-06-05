import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/models/entregas_model.dart';
import 'package:portal_fiap_professor/repository/entrega_repository.dart';
import 'package:portal_fiap_professor/screens/cadastro_trabalho.dart';
import 'package:portal_fiap_professor/screens/view_trabalho.dart';

class PesquisaTrabalhoScreen extends StatefulWidget {
  @override
  _PesquisaTrabalhoScreen createState() => _PesquisaTrabalhoScreen();
}

class _PesquisaTrabalhoScreen extends State<PesquisaTrabalhoScreen> {
  TextEditingController codigo = TextEditingController();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  // EntregasModel codigo;
  EntregaRepository entregas;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
        title: Text(
          "Pesquisar Trabalho / Prova",
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.black,
      body: 
      
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.max,
      //   children: <Widget>[
      //     //Saudação para o usuário
      //     Container(
      //       padding: EdgeInsets.all(20),
      //       width: MediaQuery.of(context).size.width,
      //     ),
      //     Divider(),
      //     Text(
      //       "Escolha um curso",
      //       style: TextStyle(
      //           fontFamily: "Roboto",
      //           fontSize: 20,
      //           fontWeight: FontWeight.w500),
      //     ),
      //     Divider(),
      //     FutureBuilder(
      //         future: listaEntregas(1),
      //         builder: (context, snapshot) {
      //           if (!snapshot.hasData) {
      //             return Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           } else {
      //             List<EntregasModel> list = snapshot.data;
      //             List<String> entregas = List();
      //             list.forEach((element) {
      //               var cont = 0;
      //               if (entregas == null) {
      //                 entregas.add(element.descricao.toString());
      //               } else {
      //                 entregas.forEach((elementC) {
      //                   element.descricao == elementC ? null : cont++;
      //                 });
      //               }

      //               if (cont < 1) {
      //                 entregas.add(element.descricao);
      //               }
      //               cont = 0;
      //             });

      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: GridView.count(
      //                   crossAxisCount: 2,
      //                   mainAxisSpacing: 30,
      //                   crossAxisSpacing: 30,
      //                   shrinkWrap: true,
      //                   children: entregas.map((value) {
      //                     return Container(
      //                       child: MaterialButton(
      //                         elevation: 0,
      //                         shape: RoundedRectangleBorder(
      //                           // borderRadius: BorderRadius.circular(20),
      //                           side: BorderSide(
      //                             color: Color(0xFFed145b),
      //                             width: 3,
      //                           ),
      //                         ),
      //                         color: Colors.white,
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: <Widget>[
      //                             Icon(
      //                               Icons.videogame_asset,
      //                               color: Color(0xFFed145b),
      //                               size: 60.0,
      //                             ),
      //                             Text(
      //                               value,
      //                               style: TextStyle(
      //                                 fontSize: 22.0,
      //                                 color: Color(0xFF949494),
      //                               ),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ],
      //                         ),
      //                         onPressed: () async {},
      //                       ),
      //                     );
      //                   }).toList()),
      //             );
      //           }
      //         })
      //   ],
      // ),


      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40.0, bottom: 5.0)),
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                              color: Color(0xFFed145b),
                              width: 2.0,
                            ),
                          ),
                          icon: Icon(Icons.code, color: Color(0xFFed145b)),
                          labelText: 'Digite o codigo',
                          labelStyle: TextStyle(
                              color: Color(0xFFed145b), fontSize: 20.0),
                          hintText: 'Exemplo: 1',
                        ),
                        style: TextStyle(fontSize: 20.0),
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Color(0xFFed145b), width: 2.0),
                          ),
                          icon:
                              Icon(Icons.date_range, color: Color(0xFFed145b)),
                          labelText: "Informe o ano",
                          labelStyle: TextStyle(
                              color: Color(0xFFed145b), fontSize: 20.0),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Color(0xFFed145b), width: 2.0),
                          ),
                          icon: Icon(
                            Icons.book,
                            color: Color(0xFFed145b),
                          ),
                          labelText: "Informe a diciplina",
                          labelStyle: TextStyle(
                              color: Color(0xFFed145b), fontSize: 20.0),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                            borderSide: BorderSide(
                                color: Color(0xFFed145b), width: 2.0),
                          ),
                          icon: Icon(
                            Icons.border_color,
                            color: Color(0xFFed145b),
                          ),
                          labelText: 'Digite o tema',
                          labelStyle: TextStyle(color: Color(0xFFed145b)),
                          hintText: 'Exemplo: Projeto mobile em flutter',
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                      padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 19.0),
                          ),
                          onPressed: () async {
                            // EntregaRepository repository = EntregaRepository();
                            // EntregasModel entregasModel;
                            // await repository
                            //     .getEntrega(int.tryParse(codigo.text))
                            //     .then((value) => entregasModel = value);
                            if (codigo.text == '') {
                              _showAlertDialog(context);
                            } else {
                              _settingModalBottomSheet(context);
                            }
                          },
                        ),
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
                          color: Colors.green,
                          child: Text(
                            "Cadastrar novo trabalho",
                            style:
                                TextStyle(color: Colors.white, fontSize: 19.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroTrabalho()),
                            );
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
      ),
    );
  }
}

  Future<List<EntregasModel>> listaEntregas(int codigo) async {
    EntregaRepository entregaRepository = EntregaRepository();

    return await entregaRepository.getAllEntregas();
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
    content: Text("É preciso inserir um valor para o código"),
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
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewTrabalho()),
                      )
                    }),
          ],
        ),
      );
    },
  );
}
