import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_string.dart';

class ModelCartProduct {
  int? cartId;
  int? cartProductId;
  int? cartProductQty;
  int? cartUserId;
  int? productId;
  String? productName;
  int? productCat;
  String? productImage;
  String? productDesc;
  int? productPrice;
  int? productQty;
  int? productUserId;

  ModelCartProduct(
      {this.cartId,
      this.cartProductId,
      this.cartProductQty,
      this.cartUserId,
      this.productId,
      this.productName,
      this.productCat,
      this.productImage,
      this.productDesc,
      this.productPrice,
      this.productQty,
      this.productUserId});

  ModelCartProduct.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    cartProductId = json['cartProductId'];
    cartProductQty = json['cartProductQty'];
    cartUserId = json['cartUserId'];
    productId = json['Product_id'];
    productName = json['Product_name'];
    productCat = json['Product_category'];
    productImage = json['Product_image'];
    productDesc = json['Product_description'];
    productPrice = json['Product_price'];
    productQty = json['Product_quantity'];
    productUserId = json['User_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartId'] = cartId;
    data['cartProductId'] = cartProductId;
    data['productQty'] = cartProductQty;
    data['cartUserId'] = cartUserId;
    data['productId'] = productId;
    data['productName'] = productName;
    data['productCat'] = productCat;
    data['productImage'] = productImage;
    data['productDesc'] = productDesc;
    data['productPrice'] = productPrice;
    data['productQty'] = productQty;
    data['productUserId'] = productUserId;
    return data;
  }
}

///Shubham
class Category {
  String? image;
  String? name;
  String? price;

  Category({this.image, this.name, this.price});

  Category.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class OrderModel {
  int? orderID;
  int? orderQty;
  int? orderProductId;
  int? orderUserId;
  int? orderStatus;

  OrderModel(
      {this.orderID,
      this.orderQty,
      this.orderProductId,
      this.orderUserId,
      this.orderStatus});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    orderQty = json['orderQty'];
    orderProductId = json['orderProductId'];
    orderUserId = json['orderUserId'];
    orderStatus = json['orderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['orderQty'] = this.orderQty;
    data['orderProductId'] = this.orderProductId;
    data['orderUserId'] = this.orderUserId;
    data['orderStatus'] = this.orderStatus;
    return data;
  }
}
