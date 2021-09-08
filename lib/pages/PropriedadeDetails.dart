import 'package:flutter/material.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/routes/AppRouters.dart';

class PropriedadeDetails extends StatelessWidget {
  final Propriedade _propriedade;

  const PropriedadeDetails(this._propriedade);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Detalhes da Propriedade',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Nome:',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: Text(
                  _propriedade.nome,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          //ROW 1

          Container(
            decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Proprietário(a):',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: Text(
                  _propriedade.proprietario,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Contato:',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: Text(
                  _propriedade.contato,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Telefone:',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: Text(
                  _propriedade.telefone,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Localização:',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: Text(
                  'Cajazeiras PB, sitio ...',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Row(// ROW 3
              children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                  child: Text(
                    "Modulos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => {
                        Navigator.pushNamed(context, AppRouters.LISTAMODULO),
                      }),
            )
          ]),
        ]));
  }
}
