import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';

import 'PropriedadeTile.dart';

class ListPropriedades extends StatelessWidget {
  //ListPropriedades(this.jwt, this.payload);
  //final String jwt;
  // final Map<String, dynamic> payload;

  /*factory ListPropriedades.fromBase64(String jwt) => ListPropriedades(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));*/

  @override
  Widget build(BuildContext context) {
    final PropriedadesProvider propriedades = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
            title: Text('Propriedades',
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouters.CREATEPROPRIEDADE);
                },
              ),
            ]),
        body: ListView.builder(
          itemCount: propriedades.count,
          itemBuilder: (ctx, i) => PropriedadeTile(propriedades.byIndex(i)),
        ));
  }
}
