class UserModel {
  String? uid;
  String? name;
  String? email;
  String? image;

  UserModel({this.uid, this.name, this.email, this.image});

  UserModel.fromJson(dynamic json) {
    uid = json['uid'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    return data;
  }
}
