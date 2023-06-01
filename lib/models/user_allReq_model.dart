import 'dart:convert';

List<UserAllReqModel> userAllReqModelFromJson(String str) =>
    List<UserAllReqModel>.from(
        json.decode(str).map((x) => UserAllReqModel.fromJson(x)));

String userAllReqModelToJson(List<UserAllReqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAllReqModel {
  String? id;
  String? name;
  String? email;
  int? age;
  String? password;
  String? url;
  DateTime? createDate;
  DateTime? updateDate;

  UserAllReqModel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.password,
    required this.url,
    required this.createDate,
    required this.updateDate,
  });

  factory UserAllReqModel.fromJson(Map<String, dynamic> json) =>
      UserAllReqModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        password: json["password"],
        url: json["url"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "age": age,
        "password": password,
        "url": url,
        "createDate": createDate!.toIso8601String(),
        "updateDate": updateDate!.toIso8601String(),
      };
}
