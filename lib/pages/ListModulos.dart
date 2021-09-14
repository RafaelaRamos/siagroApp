import 'package:flutter/material.dart';
import 'package:siagro/data/db.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/pages/CreateModulo.dart';
import 'package:siagro/pages/ModuloTile.dart';
import 'package:sqflite/sqlite_api.dart';

class ListModulos extends StatefulWidget {
  final int _idPropriedade;
  @override
  _ListModulosState createState() => _ListModulosState();

  const ListModulos(this._idPropriedade);
}

class _ListModulosState extends State<ListModulos> {
  List<Modulo> modulos;
  Database db;
  int _idPropriedade;

  @override
  void initState() {
    super.initState();

    getmodulosAll();
  }

  getmodulosAll() async {
    db = await DBHelper.instance.database;
    Iterable list = await db.query('modulos',
        columns: ["id", "nome", "lat", "lng", "idPropriedade"],
        where: '"idPropriedade" = ?',
        whereArgs: [widget._idPropriedade]);

    setState(() {
      modulos = list.map((model) => Modulo.fromJson(model)).toList();
    });
    print(modulos.toString());
    return modulos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Modulos', style: TextStyle(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CreateModulo(widget._idPropriedade)));
                },
              ),
            ]),
        body: Container(
            child: RefreshIndicator(
          onRefresh: _reloadList,
          child: ListView.builder(
              itemCount: modulos.length,
              itemBuilder: (ctx, i) => ModuloTile(modulos[i])),
        )));
  }

  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(Duration(seconds: 2), () => getmodulosAll());
    setState(() {
      modulos = newList;
    });
  }
}
