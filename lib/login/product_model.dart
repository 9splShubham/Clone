import 'dart:ffi';

class ProductModel {
  int? productId;
  String? productName;
  int? productCategory;
  String? productImage;
  String? productDescription;
  int? productPrice;
  int? productQuantity;
  int? userId;

  ProductModel(
      {this.productId,
      this.productName,
      this.productCategory,
      this.productImage,
      this.productDescription,
      this.productPrice,
      this.productQuantity,
      this.userId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['Product_id'];
    productName = json['Product_name'];
    productCategory = json['Product_category'];
    productImage = json['Product_image'];
    productDescription = json['Product_description'];
    productPrice = json['Product_price'];
    productQuantity = json['Product_quantity'];
    userId = json['User_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product_id'] = this.productId;
    data['Product_name'] = this.productName;
    data['Product_category'] = this.productCategory;
    data['Product_image'] = this.productImage;
    data['Product_description'] = this.productDescription;
    data['Product_price'] = this.productPrice;
    data['Product_quantity'] = this.productQuantity;
    data['User_id'] = this.userId;
    return data;
  }
}
