import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/data/db.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/pages/ModuloTile.dart';
import 'package:siagro/provider/ModuloProvider.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:sqflite/sqlite_api.dart';

import 'PropriedadeTile.dart';

class ListModulos extends StatefulWidget {
  @override
  _ListModulosState createState() => _ListModulosState();
}
//ListPropriedades(this.jwt, this.payload);
//final String jwt;
// final Map<String, dynamic> payload;

/*factory ListPropriedades.fromBase64(String jwt) => ListPropriedades(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));*/

class _ListModulosState extends State<ListModulos> {
  List<Modulo> modulos;
  // Provider provider=;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ModuloProvider>(context);

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
                itemCount: provider.count,
                itemBuilder: (ctx, i) =>
                    ModuloTile(provider.getmodulosAll(i)))));
  }
}
