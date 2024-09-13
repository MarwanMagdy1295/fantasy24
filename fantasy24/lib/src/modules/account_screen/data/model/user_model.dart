// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? isSuccess;
  UserData? data;

  UserModel({
    this.isSuccess,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        isSuccess: json["isSuccess"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data!.toJson(),
      };
}

class UserData {
  String? id;
  String? email;
  String? role;
  String? password;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profileImageUrl;

  UserData({
    this.id,
    this.email,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.profileImageUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        role: json["role"],
        password: json["password"],
        isVerified: json["is_verified"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
        "password": password,
        "is_verified": isVerified,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "profile_image_url": profileImageUrl,
      };
}
