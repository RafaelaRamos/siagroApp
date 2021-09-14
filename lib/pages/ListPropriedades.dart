import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:http/http.dart' as http;

import 'PropriedadeTile.dart';

class ListPropriedades extends StatefulWidget {
  //final String jwt;
  // final Map<String, dynamic> payload;
  //ListPropriedades(this.jwt, this.payload);

  /*factory ListPropriedades.fromBase64(String jwt) => ListPropriedades(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));*/

  @override
  _ListPropriedadesState createState() => _ListPropriedadesState();
}

class _ListPropriedadesState extends State<ListPropriedades> {
  List<Propriedade> propriedades;

  Future<List<Propriedade>> fetchPropriedades() async {
    final response =
        await http.get(Uri.parse("http://10.0.3.2:3000/api/v1/propriedade/2"));
    setState(() {
      Iterable list = json.decode(response.body);
      propriedades = list.map((model) => Propriedade.fromJson(model)).toList();
    });
    return propriedades;
  }

  initState() {
    super.initState();
    fetchPropriedades();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final PropriedadesProvider propriedades = Provider.of(context);

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
        body: RefreshIndicator(
            onRefresh: _reloadList,
            child: ListView.builder(
              itemCount: propriedades.length,
              itemBuilder: (ctx, i) => PropriedadeTile(propriedades[i]),
            )));
  }

  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(Duration(seconds: 2), () => fetchPropriedades());
    setState(() {
      propriedades = newList;
    });
  }
}
