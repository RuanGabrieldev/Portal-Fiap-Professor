import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/infos_si_screen.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SiPeriodosScreen extends StatefulWidget {
  SiPeriodosScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SiPeriodosScreen createState() => new _SiPeriodosScreen();
}

class Turmas {
  final String title;
  List<String> contents = [];

  static final Map<String, String> endpoints = const {
    "1° SIA": "https://github.com/",
    "1° SIB": "https://www.google.com/",
    "1° SIC": "https://flutter.dev/docs/get-started/install",
    "1° SID": "https://developer.apple.com/swift/"
  };

  Turmas(this.title, this.contents);
}

final titles = [
  'Matutino',
  'Noturno',
];

List<Turmas> policies = [
  new Turmas('Matutino', ['1° SIA', '1° SIB']),
  new Turmas('Noturno', ['1° SIC', '1° SID']),
];

class _SiPeriodosScreen extends State<SiPeriodosScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: Color(0xFFed145b)),
          title: Text(
            '1° SI Períodos',
            style: TextStyle(
              color: Color(0xFFed145b),
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfosSiScreen()),
              );
            },
          ),
        ),
        body: new ListView.builder(
          itemCount: policies.length,
          itemBuilder: (context, i) {
            return new ExpansionTile(
              title: new Text(
                policies[i].title,
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFed145b),
                ),
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(policies[i]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildExpandableContent(Turmas policies) {
    List<Widget> columnContent = [];

    for (String content in policies.contents)
      columnContent.add(
        new ListTile(
            title: new Text(
              content,
              style: new TextStyle(
                fontSize: 18.0,
                color: Color(0xFFed145b),
              ),
            ),
            onTap: () {
              _openWebUrl(Turmas.endpoints[content], content);
            }),
      );

    return columnContent;
  }

  _openWebUrl(String url, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneralWebScreen(url: url, item: title),
      ),
    );
  }
}

class GeneralWebScreen extends StatelessWidget {
  final String url;
  final String item;

  GeneralWebScreen({Key key, @required this.url, @required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
