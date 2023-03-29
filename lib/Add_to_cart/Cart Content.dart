import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_string.dart';

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
