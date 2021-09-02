import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
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

  setModulo(Modulo modulo) async {
    db = await DBHelper.instance.database;
    db.insert('modulos', {'nome': modulo.nome});
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

  Future<Modulo> getmodulosAll(int i) async {
    db = await DBHelper.instance.database;
    _modulos = await db.query('modulos', columns: ["id", "nome"]);
    _modulo = Modulo.fromMapObject(_modulos[i]);
    int count = modulos.length;
    List<Modulo> lista = [];
    print(_modulo.id);
    return _modulo;
  }

  /*Future<List<Modulo>> getModulos([int i]) async {
    var moduloList = await getModuloMap();

    int count = moduloList.length;
    print(count);
    List<Modulo> modulos = List<Modulo>(r
  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await DBHelper.instance.database;
    var result = await db.rawQuery("SELECT * FROM modulos");
    return result;
  }*/

  /* Future<Modulo> getModulo(int index) async {
    var moduloList = await getModuloMap();
    int count = moduloList.length;
    print(Modulo.fromMap(moduloList[index]));

    return Modulo.fromMap(moduloList[index]);
  }*/

  /* Future<Modulo> getLista(int index) async {
    var moduloMapList = await getMapList();
    int count = moduloMapList.length;

    // ignore: deprecated_member_use
    List<Modulo> lista = List<Modulo>();
    //for (int i = 0; i < count; i++) {
    //lista.add(Modulo.fromMapObject(moduloMapList[i]));
    //print(lista);
    //}
    Modulo mod = Modulo.fromMapObject(moduloMapList[index]);
    print(mod.toString());
    return mod;

}}  }*/
}
