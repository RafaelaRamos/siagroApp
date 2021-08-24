import 'package:sqflite/sqflite.dart';

class DB {
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        proprietario TEXT,
        contato TEXT,
        telefone TEXT
      )
      """);
  }

  static Future<Database> db() async {
    return openDatabase(
      'bd.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      String nome, String proprietario, String contato, String telefone) async {
    final db = await DB.db();

    final data = {
      'nome': nome,
      'proprietario': proprietario,
      'contato': contato,
      'telefone': telefone
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DB.db();
    return db.query('items', orderBy: "id");
  }
}
