import 'package:flutter/material.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/routes/AppRouters.dart';

class PropriedadeDetails extends StatefulWidget {
  Propriedade propriedade;

  @override
  _PropriedadeDetailsState createState() => _PropriedadeDetailsState();
}

class _PropriedadeDetailsState extends State<PropriedadeDetails> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = ModalRoute.of(context);
    if (router != null) {
      final Propriedade propriedade = router.settings.arguments as Propriedade;
    }
  }

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
                  'teste',
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
                  'Rafaela Ramos',
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
                  'Propriedade@gmail.com',
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
                  '(83)9939485885',
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
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRouters.CREATEMODULO)),
            ),
          ]),
        ]));
  }
}
