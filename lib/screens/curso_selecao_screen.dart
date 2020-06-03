import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/turmas_screen.dart';

class CursoSelecaoScreen extends StatefulWidget {
  @override
  _CursoSelecaoScreen createState() => _CursoSelecaoScreen();
}

class _CursoSelecaoScreen extends State<CursoSelecaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cursos',
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
      ),
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
                Icon(
                  Icons.videogame_asset,
                  color: Color(0xFFed145b),
                  size: 60.0,
                ),
                Text(
                  "Sistemas da Informação",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xFF949494),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TurmasScreen()),
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
                Icon(
                  Icons.computer,
                  color: Color(0xFFed145b),
                  size: 60.0,
                ),
                Text(
                  "Engenharia da Computação",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xFF949494),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TurmasScreen()),
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
                Icon(
                  Icons.queue_play_next,
                  color: Color(0xFFed145b),
                  size: 60.0,
                ),
                Text(
                  "Jogos Digitais",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xFF949494),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TurmasScreen()),
              );
            },
          ),
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
}
