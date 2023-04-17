import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_string.dart';

class CategoryList {
  List<Category>? category;

  CategoryList({this.category});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class PopularProducts {
  String? image;
  String? name;
  String? price;

  PopularProducts({this.image, this.name, this.price});

  PopularProducts.fromJson(Map<String, dynamic> json) {
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

List<PopularProducts> items() {
  List<PopularProducts> mList = [];

  PopularProducts mCategory = PopularProducts();

  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = PopularProducts();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = PopularProducts();
  mCategory.image = AppImage.Serum;
  mCategory.name = AppString.textTheOrdinaryHyaluronicAcid;
  mCategory.price = AppString.textRS3;
  mList.add(mCategory);

  mCategory = PopularProducts();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  return mList;
}

class PopularProducts1 {
  String? image;
  String? name;
  String? price;

  PopularProducts1({this.image, this.name, this.price});

  PopularProducts1.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<PopularProducts1> items2() {
  List<PopularProducts1> mList = [];

  PopularProducts1 mCategory = PopularProducts1();

  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Serum;
  mCategory.name = AppString.textTheOrdinaryHyaluronicAcid;
  mCategory.price = AppString.textRS3;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Serum;
  mCategory.name = AppString.textTheOrdinaryHyaluronicAcid;
  mCategory.price = AppString.textRS3;
  mList.add(mCategory);

  mCategory = PopularProducts1();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  return mList;
}

class Search {
  String? image;
  String? name;
  String? price;

  Search({this.image, this.name, this.price});

  Search.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<Search> Search1() {
  List<Search> mList = [];

  Search mCategory = Search();

  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Serum;
  mCategory.name = AppString.textTheOrdinaryHyaluronicAcid;
  mCategory.price = AppString.textRS3;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.doritos;
  mCategory.name = AppString.textDoritostext;
  mCategory.price = AppString.textRS;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Hamper;
  mCategory.name = AppString.textAveenoBaby;
  mCategory.price = AppString.textRS2;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Serum;
  mCategory.name = AppString.textTheOrdinaryHyaluronicAcid;
  mCategory.price = AppString.textRS3;
  mList.add(mCategory);

  mCategory = Search();
  mCategory.image = AppImage.Shampoo;
  mCategory.name = AppString.textHeadandShouldersShampoo;
  mCategory.price = AppString.textRS4;
  mList.add(mCategory);

  return mList;
}

class RecommendProducts1 {
  String? image;
  String? name;
  String? price;

  RecommendProducts1({this.image, this.name, this.price});

  RecommendProducts1.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<RecommendProducts1> Products() {
  List<RecommendProducts1> mList = [];

  RecommendProducts1 mCategory = RecommendProducts1();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.ponds;
  mCategory.name = AppString.textdPondVitaminMicellar;
  mCategory.price = AppString.textRS6;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.formula;
  mCategory.name = AppString.textFormulaMaskCollection;
  mCategory.price = AppString.textRS7;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.pampers;
  mCategory.name = AppString.textBabyDiapersNewborn;
  mCategory.price = AppString.textRS8;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.ponds;
  mCategory.name = AppString.textdPondVitaminMicellar;
  mCategory.price = AppString.textRS6;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.formula;
  mCategory.name = AppString.textFormulaMaskCollection;
  mCategory.price = AppString.textRS7;
  mList.add(mCategory);

  mCategory = RecommendProducts1();
  mCategory.image = AppImage.pampers;
  mCategory.name = AppString.textBabyDiapersNewborn;
  mCategory.price = AppString.textRS8;
  mList.add(mCategory);

  return mList;
}

class RecommendProducts {
  String? image;
  String? name;
  String? price;

  RecommendProducts({this.image, this.name, this.price});

  RecommendProducts.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<RecommendProducts> RecommendProduct() {
  List<RecommendProducts> mList = [];

  RecommendProducts mCategory = RecommendProducts();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = RecommendProducts();
  mCategory.image = AppImage.ponds;
  mCategory.name = AppString.textdPondVitaminMicellar;
  mCategory.price = AppString.textRS6;
  mList.add(mCategory);

  mCategory = RecommendProducts();
  mCategory.image = AppImage.formula;
  mCategory.name = AppString.textFormulaMaskCollection;
  mCategory.price = AppString.textRS7;
  mList.add(mCategory);

  mCategory = RecommendProducts();
  mCategory.image = AppImage.pampers;
  mCategory.name = AppString.textBabyDiapersNewborn;
  mCategory.price = AppString.textRS8;
  mList.add(mCategory);

  return mList;
}

class Product2 {
  String? image;
  String? name;
  String? price;

  Product2({this.image, this.name, this.price});

  Product2.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

List<Product2> Products2() {
  List<Product2> mList = [];

  Product2 mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  mCategory = Product2();

  mCategory.image = AppImage.medicine;
  mCategory.name = AppString.textTrueBasicsMultivitSport;
  mCategory.price = AppString.textRS5;
  mList.add(mCategory);

  return mList;
}
