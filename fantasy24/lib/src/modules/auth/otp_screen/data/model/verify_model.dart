// To parse this JSON data, do
//
//     final verifyModel = verifyModelFromJson(jsonString);

import 'dart:convert';

import 'package:next_match/src/modules/auth/otp_screen/data/model/user_model.dart';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  bool? isSuccess;
  UserModel? userModel;
  String? message;

  VerifyModel({
    this.isSuccess,
    this.userModel,
    this.message,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        isSuccess: json["isSuccess"],
        userModel: UserModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "daata": userModel!.toJson(),
        "message": message,
      };
}
