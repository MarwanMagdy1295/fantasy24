// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'dart:convert';

import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';

PlayerModel playerModelFromJson(String str) =>
    PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel {
  bool? isSuccess;
  Player? player;

  PlayerModel({
    this.isSuccess,
    this.player,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        isSuccess: json["isSuccess"],
        player: Player.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": player!.toJson(),
      };
}
