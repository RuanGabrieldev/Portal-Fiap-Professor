import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/repository/aluno_repository.dart';
import 'package:portal_fiap_professor/repository/professor_repository.dart';

class TurmasScreen extends StatefulWidget {
  @override
  _TurmasScreen createState() => _TurmasScreen();
}

class _TurmasScreen extends State<TurmasScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
ProfessorRepository professorRepository = ProfessorRepository();
AlunoRepository alunoRepository = AlunoRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.black, //Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
        title: Image.asset(
          "fiaplogo.png",
          width: 100,
        ),

        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      // body: FutureBuilder<List>(
      //   future: TurmaRepository().findAll(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {

      //       if (snapshot.data.length > 0) {
      //         return buildListView(snapshot.data);
      //       } else {
      //         return Center(
      //           child: Text("Nenhuma turma cadastrada!"),
      //         );
      //       }
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFed145b),
                        border: new Border.all(color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: MediaQuery.of(context).size.width * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("2º Ano",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Text("Sistemas de informação",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                        color: Colors.black,
                        border: new Border.all(color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                            margin: EdgeInsets.only(left: 10),
                            
                            child: Icon(
                              Icons.arrow_forward,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  // ListView buildListView(List<TurmasModel> turmas) {
  //   return ListView.builder(
  //     itemCount: turmas == null ? 0 : turmas.length,
  //     itemBuilder: (BuildContext ctx, int index) {
  //       return Dismissible(
  //         key: Key(turmas[index].idTurma.toString()),
  //         child: cardTurma(turmas[index]),
  //         direction: DismissDirection.endToStart,
  //         background: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             alignment: AlignmentDirectional.centerEnd,
  //             color: Colors.redAccent,
  //             child: Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
  //               child: Icon(
  //                 Icons.delete,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Card cardTurma(TurmasModel turma) {
  //   return Card(
  //     elevation: 12.0,
  //     margin: new EdgeInsets.symmetric(
  //       horizontal: 12.0,
  //       vertical: 6.0,
  //     ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Color.fromRGBO(64, 75, 96, .9),
  //       ),
  //       child: ListTile(
  //         contentPadding:
  //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //         leading: Container(
  //           padding: EdgeInsets.only(right: 12.0),
  //           decoration: new BoxDecoration(
  //             border: new Border(
  //               right: new BorderSide(
  //                 width: 1.0,
  //                 color: Colors.white24,
  //               ),
  //             ),
  //           ),
  //           child: Icon(
  //             Icons.autorenew,
  //             color: Colors.white,
  //           ),
  //         ),
  //         title: Text(
  //           turma.tipoCurso,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         subtitle: Row(
  //           children: <Widget>[
  //             Expanded(
  //               flex: 3,
  //               child: Padding(
  //                 padding: EdgeInsets.only(left: 10.0),
  //                 child: Text(
  //                   turma.anoCurso,
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //         trailing: Icon(
  //           Icons.keyboard_arrow_right,
  //           color: Colors.white,
  //           size: 30.0,
  //         ),
  //         onTap: () async {
  //           await Navigator.pushNamed(
  //             context,
  //             "/cursos_detalhes",
  //             arguments: turma,
  //           );

  //           setState(() {});
  //         },
  //       ),
  //     ),
  //   );
  // }

}
