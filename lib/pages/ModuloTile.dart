import 'package:flutter/material.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/routes/AppRouters.dart';

class ModuloTile extends StatefulWidget {
  Modulo modulo;

  ModuloTile(Future<Modulo> getmodulosAll, {Key key, this.modulo})
      : super(key: key);

  @override
  _ModuloTileState createState() => _ModuloTileState();
}

class _ModuloTileState extends State<ModuloTile> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: new ListTile(
        title: Text('oi',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRouters.SHOWMODULO, arguments: widget.modulo);
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
