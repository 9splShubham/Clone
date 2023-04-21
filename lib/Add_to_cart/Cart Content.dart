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
    cartProductQty = json['productQty'];
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

List<Category> cart() {
  List<Category> mList = [];

  Category mCategory = Category();

  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = Category();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = Category();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  return mList;
}
