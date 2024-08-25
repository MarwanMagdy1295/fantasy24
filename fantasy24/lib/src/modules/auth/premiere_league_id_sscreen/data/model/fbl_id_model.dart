// To parse this JSON data, do
//
//     final fblIdModel = fblIdModelFromJson(jsonString);

import 'dart:convert';

import 'package:next_match/src/modules/auth/otp_screen/data/model/user_model.dart';

FblIdModel fblIdModelFromJson(String str) =>
    FblIdModel.fromJson(json.decode(str));

String fblIdModelToJson(FblIdModel data) => json.encode(data.toJson());

class FblIdModel {
  bool? isSuccess;
  UserModel? data;

  FblIdModel({
    this.isSuccess,
    this.data,
  });

  factory FblIdModel.fromJson(Map<String, dynamic> json) => FblIdModel(
        isSuccess: json["isSuccess"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data!.toJson(),
      };
}
