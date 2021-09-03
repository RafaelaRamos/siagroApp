import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/pages/getMap.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:polymaker/polymaker.dart' as polymaker;
import 'package:http/http.dart' as http;

class CreatePropriedade extends StatefulWidget {
  @override
  _CreatePropriedadeState createState() => _CreatePropriedadeState();
}

class _CreatePropriedadeState extends State<CreatePropriedade> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  Propriedade propriedade;
  List<LatLng> locationList;
  LatLng points;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _proprietarioController = TextEditingController();
  final TextEditingController _contatoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  void getLocation() async {
    var result = await polymaker.getLocation(context,
        targetCameraPosition: LatLng(-6.88634, -38.5614),
        trackingMode: TrackingMode.PLANAR,
        enableDragMarker: true);
    if (result != null) {
      setState(() {
        locationList = result;
      });
    }
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> createProps(
      String name, String proprietario, String contato, String telefone) async {
    var res = await http
        .post(Uri.parse("http://10.0.3.2:3000/api/v1/propriedade/"), body: {
      "nome": name,
      "proprietario": proprietario,
      "contato": contato,
      "telefone": telefone,
      "userId": "2"
    });

    print(res.statusCode);

    if (res.statusCode == 201) return res.body;

    return null;
  }

  @override
  void initState() {
    super.initState();
    locationList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de nova Propriedade',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF32CD32),
                      Color(0XFF3CB371),
                      Color(0xFFADFF2F),
                    ]),
              ),
              padding:
                  EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 60),
              child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: _nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) => _formData['nome'] = value,
                                decoration: InputDecoration(
                                  labelText: "Nome da Propriedade",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: _proprietarioController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) =>
                                    _formData['Proprietário'] = value,
                                decoration: InputDecoration(
                                  labelText: "proprietário",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                controller: _contatoController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) =>
                                    _formData['contato'] = value,
                                decoration: InputDecoration(
                                  labelText: "Contato",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.phone,
                                controller: _telefoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) =>
                                    _formData['telefone'] = value,
                                decoration: InputDecoration(
                                  labelText: "Telefone",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),

                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              alignment: Alignment.center,
                              child: TextButton(
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.house_outlined,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "Sede",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ]),
                                  // ignore: sdk_version_set_literal
                                  onPressed: () => {
                                        _awaitReturnValueFromSecondScreen(
                                            context),
                                      }
                                  //arguments: propriedade,
                                  ),
                            ),
                            Container(
                              width: 250,
                              alignment: Alignment.center,
                              child: TextButton(
                                  child: Row(children: <Widget>[
                                    Icon(
                                      Icons.gps_fixed,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "Localização",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ]),
                                  onPressed: () => getLocation()

                                  //arguments: propriedade,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.3, 1],
                                  colors: [
                                    Color(0xFF32CD32),
                                    Color(0XFF3CB371),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: TextButton(
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () async {
                                    final isValid =
                                        _form.currentState.validate();

                                    if (isValid) {
                                      /*  _form.currentState.save();
                                  Provider.of<UsersProvider>(context,
                                          listen: false)
                                      .put(
                                    User(
                                      id: _formData['id'].toString(),
                                      name: _formData['nome'].toString(),
                                      email: _formData['email'].toString(),
                                      senha: _formData['senha'].toString(),
                                    ),
                                  );*/
                                      var name = _nameController.text;
                                      var proprietario =
                                          _proprietarioController.text;
                                      var contato = _contatoController.text;
                                      var telefone = _telefoneController.text;

                                      /* if (confirmarSenha != password) {
                                    displayDialog(context, "An Error Occurred",
                                        "As senhas não são iguais. Tente novamente");
                                  } else { */
                                      var newPropriedade = await createProps(
                                          name,
                                          proprietario,
                                          contato,
                                          telefone);

                                      if (newPropriedade != null) {
                                        Navigator.pop(context);
                                      } else {
                                        displayDialog(
                                            context,
                                            "An Error Occurred",
                                            "Não foi possivel criar a conta no momento!");
                                      }
                                    }

                                    /*  final isValid =
                                        _form.currentState.validate();
                                    if (isValid) {
                                      _form.currentState.save();
                                      Provider.of<PropriedadesProvider>(context,
                                              listen: false)
                                          .put(Propriedade(
                                              id: _formData['id'].toString(),
                                              nome:
                                                  _formData['nome'].toString(),
                                              proprietario:
                                                  _formData['proprietario']
                                                      .toString(),
                                              contato: _formData['contato']
                                                  .toString(),
                                              telefone: _formData['telefone']
                                                  .toString(),
                                              poligono: this.locationList,
                                              sedePoint: points));
                                      print(points);
                                      Navigator.pushNamed(context,
                                          AppRouters.LISTAPROPRIEDADES);
                                    }*/
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: Text(
                                  "Cancelar",
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => Navigator.pushNamed(
                                    context, AppRouters.GETMAPOLYGON),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ));
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetMap(),
        ));
    if (result != null) {
      setState(() {
        points = result;
      });
    }
  }
}
