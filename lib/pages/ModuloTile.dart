import 'package:flutter/material.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/pages/ShowModulo.dart';
import 'package:siagro/routes/AppRouters.dart';

class ModuloTile extends StatelessWidget {
  final Modulo _modulo;

  const ModuloTile(this._modulo);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: new ListTile(
        title: Text(_modulo.nome,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShowModulo(_modulo)));
        },
      ),
      decoration: new BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
      ),
    );
  }
}
