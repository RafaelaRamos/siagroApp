import 'package:flutter/material.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/routes/AppRouters.dart';

class ModuloTile extends StatelessWidget {
  final Modulo modulo;

  const ModuloTile(this.modulo);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: new ListTile(
        title: Text(modulo.poligono,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        onTap: () {
          Navigator.of(context).pushNamed(AppRouters.SHOWMODULO);
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
