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
        'CREATE TABLE pessoas (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
  }

  Future<void> openDb() async {
    return await getDatabasesPath().then((androidPath) async {
      String? path = androidPath + "/exemplo.db";
      db = await openDatabase(path, version: 1, onCreate: onCreate);
    });
  }
}
