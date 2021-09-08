import 'package:flutter/material.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/pages/PropriedadeDetails.dart';
import 'package:siagro/routes/AppRouters.dart';

class PropriedadeTile extends StatelessWidget {
  final Propriedade _propriedade;
  const PropriedadeTile(this._propriedade);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: new ListTile(
          title: Text(_propriedade.nome,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PropriedadeDetails(_propriedade)),
            );
          }),
      decoration: new BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
      ),
    );
  }
}
