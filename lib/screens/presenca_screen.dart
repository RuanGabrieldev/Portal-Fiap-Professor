import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';


class PresencaScreen extends StatefulWidget {
  @override
  _PresencaScreen createState() => _PresencaScreen();
}

class _PresencaScreen extends State<PresencaScreen> {


  @override
  Widget build(BuildContext context) {

DateTime now = DateTime.now();
String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(now);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: Color(0xFFed145b)),
          title: Text(
            'Períodos',
            style: TextStyle(
              color: Color(0xFFed145b),
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FuncionalidadesScreen()),
              );
            },
          ),
        ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              "Sistema de Informação",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Row(
              children: <Widget>[
                Text(
                  formattedDate,
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0),
                ),
                Spacer(flex: 1),
                Text(
                  "3ºSIR",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 30.0),
                ),
                Spacer(flex: 1),
                Text(
                  "1 de 3 alunos",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: myBoxDecoration(),
                child: Image.asset(
                  "perfil.jpeg",
                  height: 300.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "RM80562 - Gustavo Novaes",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 90.0,
                  width: 150.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.green,
                    child: Text(
                      "Presente",
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 90.0,
                  width: 150.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.redAccent,
                    child: Text(
                      "Falta",
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 90.0,
                  width: 150.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blueAccent,
                    child: Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 90.0,
                  width: 150.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blueAccent,
                    child: Text(
                      "Proximo",
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 70.0,
              width: 300.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.pinkAccent,
                child: Text(
                  "Finalizar Chamada",
                  style: TextStyle(color: Colors.white, fontSize: 19.0),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 10, color: Colors.white),
    );
  }
}
