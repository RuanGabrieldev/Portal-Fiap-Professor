import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/si_periodos_screen.dart';

import '../animated_dialog_box.dart';

class InfosSiScreen extends StatelessWidget {
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
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(40),
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        children: <Widget>[
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Color(0xFFed145b),
                width: 2,
              ),
            ),
            color: Colors.white,
            child: const Text(
              "1° SI",
              style: TextStyle(
                fontSize: 40.0,
                // fontWeight: FontWeight.bold,
                color: Color(0xFFed145b),
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Color(0xFFed145b),
                width: 2,
              ),
            ),
            color: Colors.white,
            child: const Text(
              "2° SI",
              style: TextStyle(
                fontSize: 40.0,
                // fontWeight: FontWeight.bold,
                color: Color(0xFFed145b),
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Color(0xFFed145b),
                width: 2,
              ),
            ),
            color: Colors.white,
            child: const Text(
              "3° SI",
              style: TextStyle(
                fontSize: 40.0,
                // fontWeight: FontWeight.bold,
                color: Color(0xFFed145b),
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiPeriodosScreen()),
              );
            },
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Color(0xFFed145b),
                width: 2,
              ),
            ),
            color: Colors.white,
            child: const Text(
              "4° SI",
              style: TextStyle(
                fontSize: 40.0,
                // fontWeight: FontWeight.bold,
                color: Color(0xFFed145b),
              ),
              textAlign: TextAlign.center,
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
