class CartModel {
  int? cartId;
  int? cartProductId;
  int? cartProductQty;
  int? cartUserId;

  CartModel(
      {this.cartId, this.cartProductId, this.cartProductQty, this.cartUserId});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    cartProductId = json['cartProductId'];
    cartProductQty = json['CartProductQty'];
    cartUserId = json['CartUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['cartProductId'] = this.cartProductId;
    data['CartProductQty'] = this.cartProductQty;
    data['CartUserId'] = this.cartUserId;
    return data;
  }
}
