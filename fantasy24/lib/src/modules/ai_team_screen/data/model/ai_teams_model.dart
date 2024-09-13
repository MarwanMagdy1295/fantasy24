// To parse this JSON data, do
//
//     final aiTeamsModel = aiTeamsModelFromJson(jsonString);

import 'dart:convert';

import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

AiTeamsModel aiTeamsModelFromJson(String str) =>
    AiTeamsModel.fromJson(json.decode(str));

String aiTeamsModelToJson(AiTeamsModel data) => json.encode(data.toJson());

class AiTeamsModel {
  bool? isSuccess;
  List<PlayerData>? playersListData;

  AiTeamsModel({
    this.isSuccess,
    this.playersListData,
  });

  factory AiTeamsModel.fromJson(Map<String, dynamic> json) => AiTeamsModel(
        isSuccess: json["isSuccess"],
        playersListData: List<PlayerData>.from(
            json["data"].map((x) => PlayerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": List<dynamic>.from(playersListData!.map((x) => x.toJson())),
      };
}

class PlayerData {
  String? playerId;
  double? eventExpectedPoints;
  bool? isCaptain;
  bool? isViceCaptain;
  bool? isSubs;
  Player? player;

  PlayerData({
    this.playerId,
    this.eventExpectedPoints,
    this.isCaptain,
    this.isViceCaptain,
    this.isSubs,
    this.player,
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) => PlayerData(
        playerId: json["player_id"],
        eventExpectedPoints: json["event_expected_points"].toDouble(),
        isCaptain: json["is_captain"],
        isViceCaptain: json["is_vice_captain"],
        isSubs: json["is_subs"],
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "event_expected_points": eventExpectedPoints,
        "is_captain": isCaptain,
        "is_vice_captain": isViceCaptain,
        "is_subs": isSubs,
        "player": player!.toJson(),
      };
}

class Player {
  String? id;
  String? firstName;
  String? secondName;
  String? webName;
  int? nowCost;
  int? playerTypeId;
  String? teamId;
  String? photo;
  Team? team;
  List<PlayerPrediction>? playerPredictions;

  Player({
    this.id,
    this.firstName,
    this.secondName,
    this.webName,
    this.nowCost,
    this.playerTypeId,
    this.teamId,
    this.photo,
    this.team,
    this.playerPredictions,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        secondName: json["second_name"],
        webName: json["web_name"],
        nowCost: json["now_cost"],
        playerTypeId: json["player_type_id"],
        teamId: json["team_id"],
        photo: json["photo"],
        team: Team.fromJson(json["team"]),
        playerPredictions: List<PlayerPrediction>.from(
            json["playerPredictions"].map((x) => PlayerPrediction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "second_name": secondName,
        "web_name": webName,
        "now_cost": nowCost,
        "player_type_id": playerTypeId,
        "team_id": teamId,
        "photo": photo,
        "team": team!.toJson(),
        "playerPredictions":
            List<dynamic>.from(playerPredictions!.map((x) => x.toJson())),
      };
}
