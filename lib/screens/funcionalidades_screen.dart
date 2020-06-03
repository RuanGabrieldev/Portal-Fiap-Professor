import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/presenca_screen.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';
import 'package:portal_fiap_professor/screens/visu_entregaveis_screen.dart';

class FuncionalidadesScreen extends StatefulWidget {
  final String periodo;
  const FuncionalidadesScreen({Key key, this.periodo}) : super(key: key);

  @override
  _FuncionalidadesScreen createState() => _FuncionalidadesScreen();
}

class _FuncionalidadesScreen extends State<FuncionalidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Color(0xFFed145b)),
        title: Text(
          'Funcionalidades ${widget.periodo}',
          style: TextStyle(
            color: Color(0xFFed145b),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
            );
          },
        ),
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
                  Icons.format_list_numbered,
                  color: Color(0xFFed145b),
                  size: 60.0,
                ),
                Text(
                  "Lista de presença",
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
                MaterialPageRoute(builder: (context) => PresencaScreen()),
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
                  Icons.save_alt,
                  color: Color(0xFFed145b),
                  size: 60.0,
                ),
                Text(
                  "Entrega de trabalhos",
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
                MaterialPageRoute(builder: (context) => VisuEntregaveisScreen()),
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
