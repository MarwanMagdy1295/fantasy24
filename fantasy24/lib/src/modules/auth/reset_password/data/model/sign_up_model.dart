// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  bool? isSuccess;
  Data? data;
  String? message;

  SignupModel({
    this.isSuccess,
    this.data,
    this.message,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        isSuccess: json["isSuccess"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? accessToken;
  String? role;

  Data({
    this.accessToken,
    this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "role": role,
      };
}
