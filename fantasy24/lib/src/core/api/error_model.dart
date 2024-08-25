// To parse this JSON data, do
//
//     final errorDataModel = errorDataModelFromJson(jsonString);

import 'dart:convert';

ErrorDataModel errorDataModelFromJson(String str) =>
    ErrorDataModel.fromJson(json.decode(str));

String errorDataModelToJson(ErrorDataModel data) => json.encode(data.toJson());

class ErrorDataModel {
  bool? isSuccess;
  String? message;

  ErrorDataModel({
    this.isSuccess,
    this.message,
  });

  factory ErrorDataModel.fromJson(Map<String, dynamic> json) => ErrorDataModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
      };
}
