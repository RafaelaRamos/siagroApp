import 'package:path_provider/path_provider.dart';
import 'package:siagro/models/Modulo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io' as io;

import 'package:path/path.dart';

class DBHelper {
  static const String TABLE = 'siagro';
  static const String ID = 'id';
  static const String NOME = 'nome';
  static const String PROPRIETARIO = 'proprietario';
  static const String CONTATO = 'contato';
  static const String TELEFONE = 'telefone';
  static const String POLIGONO = 'poligono';
  static const String DB_NAME = 'siagro.db';

  DBHelper._();
  // Criar uma instancia de DB
  static final DBHelper instance = DBHelper._();
  //Instancia do SQLite
  static Database _db;

  get database async {
    if (_db != null) return _db;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'siagro.db'),
      version: 3,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_modulo);
  }

  String get _modulo => '''
    CREATE TABLE modulos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
       nome TEXT,
       poligono TEXT
     
    );
  ''';
}
