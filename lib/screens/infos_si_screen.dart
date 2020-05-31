import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/turma_repository.dart';

class InfosSiScreen extends StatefulWidget {
  @override
  _InfosSiScreen createState() => _InfosSiScreen();
}

class _InfosSiScreen extends State<InfosSiScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SI Info',
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
      ),
      body: FutureBuilder<List>(
        future: TurmaRepository().findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length > 0) {
              return buildListView(snapshot.data);
            } else {
              TurmaRepository().createRaw();
              return Center(
                child: Text("Nenhuma turma cadastrada!"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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

  ListView buildListView(List<TurmasModel> turmas) {
    return ListView.builder(
      itemCount: turmas == null ? 0 : turmas.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(turmas[index].idTurma.toString()),
          child: cardTurma(turmas[index]),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Card cardTurma(TurmasModel turma) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
          ),
          title: Text(
            turma.tipoCurso,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    turma.anoCurso,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () async {
            await Navigator.pushNamed(
              context,
              "/cursos_detalhes",
              arguments: turma,
            );

            setState(() {});
          },
        ),
      ),
    );
  }

  // body: GridView.count(
  //   primary: false,
  //   padding: const EdgeInsets.all(40),
  //   crossAxisSpacing: 40,
  //   mainAxisSpacing: 40,
  //   crossAxisCount: 2,
  //   children: <Widget>[
  //     MaterialButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: BorderSide(
  //           color: Color(0xFFed145b),
  //           width: 2,
  //         ),
  //       ),
  //       color: Colors.white,
  //       child: const Text(
  //         "1° SI",
  //         style: TextStyle(
  //           fontSize: 40.0,
  //           // fontWeight: FontWeight.bold,
  //           color: Color(0xFFed145b),
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //       onPressed: () async {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
  //         );
  //       },
  //     ),
  //     MaterialButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: BorderSide(
  //           color: Color(0xFFed145b),
  //           width: 2,
  //         ),
  //       ),
  //       color: Colors.white,
  //       child: const Text(
  //         "2° SI",
  //         style: TextStyle(
  //           fontSize: 40.0,
  //           // fontWeight: FontWeight.bold,
  //           color: Color(0xFFed145b),
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //       onPressed: () async {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
  //         );
  //       },
  //     ),
  //     MaterialButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: BorderSide(
  //           color: Color(0xFFed145b),
  //           width: 2,
  //         ),
  //       ),
  //       color: Colors.white,
  //       child: const Text(
  //         "3° SI",
  //         style: TextStyle(
  //           fontSize: 40.0,
  //           // fontWeight: FontWeight.bold,
  //           color: Color(0xFFed145b),
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //       onPressed: () async {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
  //         );
  //       },
  //     ),
  //     MaterialButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: BorderSide(
  //           color: Color(0xFFed145b),
  //           width: 2,
  //         ),
  //       ),
  //       color: Colors.white,
  //       child: const Text(
  //         "4° SI",
  //         style: TextStyle(
  //           fontSize: 40.0,
  //           // fontWeight: FontWeight.bold,
  //           color: Color(0xFFed145b),
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //       onPressed: () async {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
  //         );
  //       },
  //     ),
  //   ],
  // ),

}
