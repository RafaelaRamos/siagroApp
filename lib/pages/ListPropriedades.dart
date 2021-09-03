import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:http/http.dart' as http;

import 'PropriedadeTile.dart';

class ListPropriedades extends StatefulWidget {
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
        body: ListView.builder(
          itemCount: propriedades.length,
          itemBuilder: (ctx, i) => PropriedadeTile(propriedades[i]),
        ));
  }
}
