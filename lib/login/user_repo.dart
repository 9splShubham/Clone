import 'dart:ffi';

import 'package:sqflite/sqflite.dart';

class UserRepo {
  void createTable(Database? db) {
    db?.execute('''CREATE TABLE IF NOT EXISTS USER
        (ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT,email VARCHAR,mobileno VARCHAR ,password VARCHAR)''');
  }

  void deleteTable(Database? db) {
    db?.execute('''DROP TABLE USER''');
  }

  Future<void> getUsers(Database? db) async {
    final List<Map<String, dynamic>> maps = await db!.query('User');
    print(maps);
  }
}
