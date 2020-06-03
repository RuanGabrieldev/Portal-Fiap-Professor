import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/screens/funcionalidades_screen.dart';
import 'package:portal_fiap_professor/screens/turmas_screen.dart';

class SiPeriodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                MaterialPageRoute(builder: (context) => TurmasScreen()),
              );
            },
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index], context),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class Entry {
  Entry(
    this.title, [
    this.children = const <Entry>[],
  ]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'Matutino',
    <Entry>[
      Entry('1° SIA'),
      Entry('1° SIB'),
    ],
  ),
  Entry(
    'Noturno',
    <Entry>[
      Entry('1° SIC'),
      Entry('1° SID'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);

  final Entry entry;
  final BuildContext context;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return new ListTile(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) {
                return new FuncionalidadesScreen(periodo: root.title);
              },
            ),
          );
        },
        title: new Text(root.title),
      );
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
