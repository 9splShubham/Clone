class UserModel {
  int? id;
  String? name;
  String? email;
  String? mobileno;
  String? password;

  UserModel({this.id, this.name, this.email, this.mobileno, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileno = json['mobileno'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileno'] = this.mobileno;
    data['password'] = this.password;
    return data;
  }
}
