import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:provider/provider.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:polymaker/polymaker.dart' as polymaker;

class CreatePropriedade extends StatefulWidget {
  @override
  _CreatePropriedadeState createState() => _CreatePropriedadeState();
}

class _CreatePropriedadeState extends State<CreatePropriedade> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  Propriedade propriedade;
  List<LatLng> locationList;

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
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.text,
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
                                  onPressed: () {
                                    final isValid =
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
                                              poligono: this.locationList));
                                      print(locationList);
                                      Navigator.pushNamed(context,
                                          AppRouters.LISTAPROPRIEDADES);
                                    }
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
}
