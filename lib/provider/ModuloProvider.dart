import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siagro/Convert.dart';
import 'package:siagro/data/db.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:sqflite/sqlite_api.dart';

class ModuloProvider with ChangeNotifier {
  Database db;

  Map<String, Modulo> _mod = {};
  final List<Modulo> modulos = [];

  Future<List<Map<String, dynamic>>> getModuloMap() async {
    Database db = await DBHelper.instance.database;
    var result = await db.rawQuery("SELECT * FROM modulos");
    return result;
  }

  setModulo(Modulo modulo, List<LatLng> poligono) async {
    print(modulo.toString());
    db = await DBHelper.instance.database;
    String lat = convertPointsLat(poligono);
    String lng = convertPointsLng(poligono);
    db.insert('modulos', {
      'nome': modulo.nome,
      'lat': lat,
      'lng': lng,
      'idPropriedade': modulo.idPropriedade
    });

    notifyListeners();
  }
}
