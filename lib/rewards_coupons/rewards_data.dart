import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_string.dart';

class Rewards {
  String? perct;
  String? title;
  String? desc;

  Rewards({this.perct, this.title, this.desc});

  Rewards.fromJson(Map<String, dynamic> json) {
    perct = json['perct'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['perct'] = perct;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}

List<Rewards> rewards() {
  List<Rewards> mList = [];

  Rewards mRewards = Rewards();

  mRewards.perct = AppString.textperct1;
  mRewards.title = AppString.texttitle1;
  mRewards.desc = AppString.textRS;
  mList.add(mRewards);

  mRewards = Rewards();
  mRewards.perct = AppString.textperct1;
  mRewards.title = AppString.texttitle1;
  mRewards.desc = AppString.textRS;
  mList.add(mRewards);

  return mList;
}
