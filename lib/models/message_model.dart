class MessageModel {
  String? text;
  String? fromName;
  String? fromUid;
  String? fromImage;
  String? toName;
  String? toUid;
  String? toImage;
  int? createdAt;

  MessageModel(
      {this.text,
      this.fromName,
      this.fromUid,
      this.fromImage,
      this.toImage,
      this.toName,
      this.toUid,
      this.createdAt});

  MessageModel.fromJson(dynamic json) {
    text = json['text'];
    fromName = json['from_name'];
    fromImage = json['from_image'];
    fromUid = json['from_uid'];
    toName = json['to_name'];
    toImage = json['to_image'];
    toUid = json['to_uid'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['from_name'] = this.fromName;
    data['from_image'] = this.fromImage;
    data['from_uid'] = this.fromUid;
    data['to_name'] = this.toName;
    data['to_image'] = this.toImage;
    data['to_uid'] = this.toUid;
    data['created_at'] = this.createdAt;
    return data;
  }
}
