import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/vendor/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'user_model.dart';
import 'product_model.dart';

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

  static const String Table_Product = 'product';
  static const String Product_Id = 'Product_id';
  static const String Product_Name = 'Product_name';
  static const String Product_Category = 'Product_category';
  static const String Product_Image = 'Product_image';
  static const String Product_Desc = 'Product_description';
  static const String Product_Price = 'Product_price';
  static const String Product_Qty = 'Product_quantity';
  static const String Product_User_Id = 'User_id';

  static const String Table_Cart = 'cart';
  static const String Cart_ID = 'cartId';
  static const String Cart_Product_Id = 'cartProductId';
  static const String Cart_Product_Qty = 'cartProductQty';
  static const String Cart_User_Id = 'cartUserId';

/*  static const String Table_Order = 'user_order';
  static const String Order_ID = 'orderId';
  static const String Order_Qty = 'orderQty';
  static const String Order_Product_Id = 'orderProductId';
  static const String Order_User_Id = 'orderUserId';
  static const String Order_Status = 'orderStatus';*/

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

    await db.execute("CREATE TABLE $Table_Product ("
        " $Product_Id INTEGER PRIMARY KEY, "
        " $Product_Name TEXT, "
        " $Product_Category INTEGER,"
        " $Product_Image TEXT,"
        " $Product_Desc TEXT,"
        " $Product_Price INTEGER,"
        " $Product_Qty INTEGER,"
        " $Product_User_Id INTEGER "
        ")");

    await db.execute("CREATE TABLE $Table_Cart ("
        " $Cart_ID INTEGER PRIMARY KEY, "
        " $Cart_Product_Id INTEGER, "
        " $Cart_Product_Qty INTEGER,"
        " $Cart_User_Id INTEGER"
        ")");

/*    await db.execute("CREATE TABLE $Table_Order ("
        " $Order_ID INTEGER PRIMARY KEY,"
        " $Order_Qty INTEGER,"
        " $Order_Product_Id INTEGER,"
        " $Order_User_Id INTEGER,"
        " $Order_Status INTEGER"
        ")");*/
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toJson());
    return res;
  }

  Future<int> saveProduct(ProductModel product) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Product, product.toJson());
    return res;
  }

  Future<int> saveCart(CartModel cart) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_Cart, cart.toJson());
    return res;
  }

  Future<List<ProductModel>> getUserProduct(int userId) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_Product WHERE "
        "$Product_User_Id = $userId ");
    try {
      List<ProductModel> mProductModel = List<ProductModel>.from(
          res.map((model) => ProductModel.fromJson(model)));

      return mProductModel;
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProduct(int categoryId) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_Product WHERE "
        "$Product_Category = $categoryId ");
    try {
      List<ProductModel> mProductModel = List<ProductModel>.from(
          res.map((model) => ProductModel.fromJson(model)));
      return mProductModel;
    } catch (e) {
      return [];
    }
  }

  Future<List<ModelCartProduct>> getUserCart(int userId) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM $Table_Cart INNER JOIN $Table_Product on $Table_Product.$Product_Id=$Table_Cart.$Cart_Product_Id WHERE $Cart_User_Id = $userId");

    try {
      List<ModelCartProduct> mCartModel = List<ModelCartProduct>.from(
          res.map((model) => ModelCartProduct.fromJson(model)));

      return mCartModel;
    } catch (e) {
      return [];
    }
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

  ///UpdateCart
  Future<List<CartModel>> updateCart(int qty, int cartId) async {
    var dbClient = await db;
    String q =
        'UPDATE $Table_Cart SET $Cart_Product_Qty = $qty WHERE $Cart_ID = $cartId';
    print('object---->${q}');
    var value = await dbClient.rawQuery(q);
    print('object--value-->$value');
    List<CartModel> mModelCategory =
        List<CartModel>.from(value.map((model) => CartModel.fromJson(model)));
    return mModelCategory;
  }

  Future<CartModel> getCartProduct(int productId, int userId) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_Cart WHERE "
        "$Cart_Product_Id = $productId AND "
        "$Cart_User_Id = $userId");

    if (res.length > 0) {
      return CartModel.fromJson(res.first);
    }
    return CartModel();
  }

  ///RemoveFromCart
  Future<int> deleteCart(int id) async {
    var dbClient = await db;
    return await dbClient
        .rawDelete('DELETE FROM $Table_Cart WHERE $Cart_ID = ?', [id]);
  }

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
