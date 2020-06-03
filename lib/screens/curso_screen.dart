import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/models/login_model.dart';
import 'package:portal_fiap_professor/models/professor_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/professor_repository.dart';
import 'package:portal_fiap_professor/repository/turma_repository.dart';

class CursoSelecaoScreen extends StatefulWidget {
  @override
  _CursoSelecaoScreen createState() => _CursoSelecaoScreen();
}

class _CursoSelecaoScreen extends State<CursoSelecaoScreen> {
  @override
  Widget build(BuildContext context) {
    ProfessorModel user = ModalRoute.of(context).settings.arguments;
    ProfessorModel professor;
    AlunosModel aluno;
    if (user.runtimeType == ProfessorModel) {
      professor = user;
      aluno = null;
    } else {
      professor = null;
      // aluno = user;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "fiaplogo.png",
          width: 100,
        ),
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //Saudação para o usuário
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Bem vindo,",
                  style: TextStyle(fontFamily: "Lobster", fontSize: 30),
                ),
                Text(
                  aluno == null ? professor.nomeProfessor : aluno.nome,
                  style: TextStyle(fontFamily: "Quicksand", fontSize: 50),
                ),
              ],
            ),
          ),
          Divider(),
          Text(
            "Escolha um curso",
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Divider(),
          FutureBuilder(
              future: listaCurso(professor.pf),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<TurmasModel> list = snapshot.data;
                  List<String> cursos = List(); 
                  list.forEach((element) { 
                    var cont = 0;
                   if(cursos == null){
                     cursos.add(element.tipoCurso.toString());
                   }else{
                      cursos.forEach((elementC) {
                      element.tipoCurso == elementC ? null : cont++;
                    });
                   }

                    if(cont < 1){
                      cursos.add(element.tipoCurso);
                    }
                    cont = 0;
                  });

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        shrinkWrap: true,
                        children: cursos.map((value) {                            
                          return Container(
                            child: MaterialButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: Color(0xFFed145b),
                                  width: 3,
                                ),
                              ),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.videogame_asset,
                                    color: Color(0xFFed145b),
                                    size: 60.0,
                                  ),
                                  Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Color(0xFF949494),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onPressed: () async {},
                            ),
                          );
                        }).toList()),
                  );
                }
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<TurmasModel>> listaCurso(int id) async {
    TurmaRepository turmaRepository = TurmaRepository();

    return await turmaRepository.getAllTurma();
  }
}
