class UserModel {
  int? id;
  String? name;
  String? email;
  String? mobileno;
  String? password;
  int? usertype;
  String? usertypeName;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.mobileno,
      this.password,
      this.usertype,
      this.usertypeName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileno = json['mobileno'];
    password = json['password'];
    usertype = json['usertype'];
    usertypeName = json['userTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileno'] = this.mobileno;
    data['password'] = this.password;
    data['usertype'] = this.usertype;
    data['userTypeName'] = this.usertypeName;
    return data;
  }
}
