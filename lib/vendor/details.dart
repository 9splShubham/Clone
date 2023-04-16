import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_string.dart';

class Details {
  String? orderNo;
  String? rs;
  String? email;
  String? dateTime;
  String? image;

  Details({this.orderNo, this.rs, this.email, this.dateTime, this.image});

  Details.fromJson(Map<String, dynamic> json) {
    orderNo = json['order no'];
    rs = json['rs'];
    email = json['email'];
    dateTime = json['date time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order no'] = this.orderNo;
    data['rs'] = this.rs;
    data['email'] = this.email;
    data['date time'] = this.dateTime;
    data['image'] = this.image;
    return data;
  }
}


List<Details> details() {
  List<Details> mList = [];

  Details mDetails = Details();

  mDetails.orderNo = AppString.textorderNo123321123;
  mDetails.rs = AppString.text$5025;
  mDetails.email = AppString.textjohndoemailcom;
  mDetails.dateTime = AppString.text200320211015  ;
  mDetails.image = AppImage.doritos;
  mDetails.image = AppImage.Hamper;
  mDetails.image = AppImage.Shampoo;
  mList.add(mDetails);

  mDetails = Details();
  mDetails.orderNo = AppString.textOrderNo235321546;
  mDetails.rs = AppString.textL60025;
  mDetails.email =  AppString.textjohndoemailcom;
  mDetails.dateTime = AppString.text200320211015 ;
  mDetails.image = AppImage.Serum;
  mDetails.image = AppImage.medicine;
  mDetails.image = AppImage.Hamper;
  mDetails.image = AppImage.Shampoo;

  mList.add(mDetails);


  return mList;
}