import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cart.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY, productId VARCHAR,productName VARCHAR UNIQUE,price INTEGER,quantity INTEGER,imageUrl VARCHAR)');
  }

  Future<Map<String, Object>> insert(Map<String, Object> cart) async {
    var dbClient = await db;
    await dbClient!.insert('cart', cart);
    return cart;
  }
}
