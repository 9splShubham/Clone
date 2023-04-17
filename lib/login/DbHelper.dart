import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'user_model.dart';

class DbHelper {
  late Database _db;

  static const String DB_Name = 'phcy.db';
  static const String Table_User = 'user';
  static const int Version = 3;
  static const String C_UserID = 'id';
  static const String C_UserName = 'name';
  static const String C_Email = 'email';
  static const String C_MobileNo = 'mobileno';
  static const String C_Password = 'password';
  static const String C_Type = 'usertype';
  static const String C_TypeName = 'usertypeName';

  Future<Database> get db async {
    /* if (_db != null) {
      return _db;
    }*/
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID INTEGER PRIMARY KEY, "
        " $C_UserName TEXT, "
        " $C_Email TEXT ,"
        " $C_MobileNo TEXT,"
        " $C_Type INTEGER,"
        " $C_TypeName TEXT,"
        " $C_Password TEXT "
        /*  " PRIMARY KEY ($C_UserID)"*/
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toJson());
    return res;
  }

  Future<UserModel> getLoginUser(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Email = '$email' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel();
  }

  Future<UserModel> getCheckEmailUser(String email) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Email = '$email'");

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel();
  }

  Future<UserModel> printCheckUserType(bool vendor) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "INSERT INTO $Table_User ($C_Type) VALUES ('?')",
        [vendor ? 'vendor' : 'Customer']);

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel();
  }

/*  Future<UserModel> printVendor() async {
    var dbClient = await db;
    var res = await dbClient
        .rawQuery('''INSERT INTO $Table_User ($C_Type) VALUES('vendor')''');

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel();
  }

  Future<UserModel> printCustomer() async {
    var dbClient = await db;
    var res = await dbClient
        .rawQuery('''INSERT INTO $Table_User ($C_Type) VALUES('Customer')''');

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel();
  }*/

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toJson(),
        where: '$C_UserID = ?', whereArgs: [user.id]);
    return res;
  }

  Future<int> deleteUser(int user_id) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(Table_User, where: '$C_UserID =5', whereArgs: [user_id]);
    return res;
  }
}