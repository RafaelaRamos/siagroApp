import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:provider/provider.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:siagro/provider/ModuloProvider.dart';
import 'package:siagro/provider/PropriedadeProvider.dart';
import 'package:siagro/routes/AppRouters.dart';
import 'package:polymaker/polymaker.dart' as polymaker;

class CreateModulo extends StatefulWidget {
  @override
  _CreateModuloState createState() => _CreateModuloState();
}

class _CreateModuloState extends State<CreateModulo> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  Future<Modulo> modulo;
  List<LatLng> locationList;
  double lat;
  double long;

  @override
  void initState() {
    super.initState();
    _posicaoAtual();
    locationList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Modulo',
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
                                  labelText: "Nome do Modulo",
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
                                  onPressed: () => {getLocation()}

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
                                      Provider.of<ModuloProvider>(context,
                                              listen: false)
                                          .setModulo(
                                              Modulo(
                                                nome: _formData['nome']
                                                    .toString(),
                                              ),
                                              this.locationList);

                                      Navigator.pushNamed(
                                          context, AppRouters.LISTAMODULO);
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
                                    context, AppRouters.LISTAMODULO),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ));
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }
    print(Geolocator.getCurrentPosition());
    return await Geolocator.getCurrentPosition();
  }

  void getLocation() async {
    Position posicao = await _posicaoAtual();
    lat = posicao.latitude;
    long = posicao.longitude;

    var result = await polymaker.getLocation(context,
        targetCameraPosition: LatLng(-6.88634, -38.5614),
        //LatLng(-6.88634, -38.5614),
        trackingMode: TrackingMode.PLANAR,
        enableDragMarker: true);
    if (result != null) {
      setState(() {
        locationList = result;
      });
      print(locationList.toString());
    }
  }
}
