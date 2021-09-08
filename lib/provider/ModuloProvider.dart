import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siagro/data/db.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:siagro/models/Propriedade.dart';
import 'package:sqflite/sqlite_api.dart';

class ModuloProvider with ChangeNotifier {
  Database db;
  int _cont;
  List _modulos;
  Modulo _modulo;

  //final List<Modulo> _modulo = [];

  ModuloProvider() {
    _initRepository();
  }
  _initRepository() async {}

  setModulo(Modulo modulo, List<LatLng> poligono) async {
    db = await DBHelper.instance.database;
    var poligonoString = poligono.toString();
    convertPoints(poligonoString);
    db.insert('modulos', {'nome': modulo.nome, 'poligono': poligonoString});
    notifyListeners();
  }

  Map<String, Modulo> _mod = {};
  final List<Modulo> modulos = [];

  List<Modulo> get all {
    //return [...propriedades.values];
  }

  Future<List<Map<String, dynamic>>> getModuloMap() async {
    Database db = await DBHelper.instance.database;
    var result = await db.rawQuery("SELECT * FROM modulos");

    return result;
  }

  int get count {
    return _modulos.length;
  }

  getmodulosAll() async {
    db = await DBHelper.instance.database;
    Iterable list =
        await db.query('modulos', columns: ["id", "nome", "poligono"]);
    _modulos = list.map((model) => Modulo.fromJson(model)).toList();

    notifyListeners();
  }

  convertPoints(String teste) {
    var testando = teste.split("LatLng(");
    var test = testando.toString().split(') ,');
    print('TESTANDO MODULO' + test.toString());
  }
}
