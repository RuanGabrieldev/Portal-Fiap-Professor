import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/curso_selecao_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';

class TurmasScreen extends StatefulWidget {
  @override
  _TurmasScreen createState() => _TurmasScreen();
}

class _TurmasScreen extends State<TurmasScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
        title: Text(
          'Info',
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CursoSelecaoScreen()),
            );
          },
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

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(40),
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        children: <Widget>[
          MaterialButton(
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
                Text(
                  "1",
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ANO",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
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
                Text(
                  "2",
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ANO",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
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
                Text(
                  "3",
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ANO",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
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
                Text(
                  "4",
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ANO",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFed145b),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
        ],
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
