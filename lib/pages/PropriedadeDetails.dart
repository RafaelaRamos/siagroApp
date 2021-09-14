import 'package:flutter/material.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/pages/ListModulos.dart';
import 'package:siagro/pages/showPropriedade.dart';

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
                  height: 40,
                  child: TextButton(
                      child: Text(
                        "Visualizar Localização",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowPropriedade(_propriedade)))
                          }),
                )
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
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListModulos(_propriedade.id)))
                      }),
            )
          ]),
        ]));
  }
}
