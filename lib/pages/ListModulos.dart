import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/data/db.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/pages/ModuloTile.dart';
import 'package:siagro/provider/ModuloProvider.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:sqflite/sqlite_api.dart';

class ListModulos extends StatefulWidget {
  @override
  _ListModulosState createState() => _ListModulosState();
}

class _ListModulosState extends State<ListModulos> {
  List<Modulo> modulos;
  Database db;
  @override
  void initState() {
    super.initState();
    getmodulosAll();
  }

  getmodulosAll() async {
    db = await DBHelper.instance.database;
    Iterable list =
        await db.query('modulos', columns: ["id", "nome", "lat", "lng"]);
    setState(() {
      modulos = list.map((model) => Modulo.fromJson(model)).toList();
    });
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
                  Navigator.of(context).pushNamed(AppRouters.CREATEMODULO);
                },
              ),
            ]),
        body: Container(
            child: ListView.builder(
          itemCount: modulos.length,
          itemBuilder: (ctx, i) => ModuloTile(modulos[i]),
        )));
  }
}
