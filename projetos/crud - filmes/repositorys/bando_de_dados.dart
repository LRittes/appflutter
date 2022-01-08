import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static final BancoDeDados? _instance = BancoDeDados._();
  Database? db;

  BancoDeDados._();

  factory BancoDeDados() {
    return _instance!;
  }

  Future<void> onCreate(Database db, int version) async {
    db.execute(
        'CREATE TABLE filmes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, sinopse TEXT, duracaoMinutos TEXT, maior18 BLOB)');
  }

  Future<void> openDB() async {
    return await getDatabasesPath().then((androidPath) async {
      String? path = androidPath + '/dbfilmes.sql';
      db = await openDatabase(path, version: 1, onCreate: onCreate);
    });
  }
}
