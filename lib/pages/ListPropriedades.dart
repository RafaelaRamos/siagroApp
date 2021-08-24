import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';

import 'PropriedadeTile.dart';

class ListPropriedades extends StatelessWidget {
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
