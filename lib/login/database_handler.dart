import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();

  static Database? _database;

  factory DatabaseHandler() {
    return _databaseHandler;
  }

  DatabaseHandler._internal();

  Future<Database?> openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'demo.db'));
    return _database;
  }

  Future<dynamic> userLogin(String email, String password) async {
    var dbClient = await _database;
    var value = await dbClient!.rawQuery(
        "SELECT * FROM User where email=$email and password=$password");
    return value;
  }
}
