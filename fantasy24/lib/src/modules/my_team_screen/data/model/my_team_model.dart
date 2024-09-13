// To parse this JSON data, do
//
//     final myTeamModel = myTeamModelFromJson(jsonString);

import 'dart:convert';

import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';

MyTeamModel myTeamModelFromJson(String str) =>
    MyTeamModel.fromJson(json.decode(str));

String myTeamModelToJson(MyTeamModel data) => json.encode(data.toJson());

class MyTeamModel {
  bool? isSuccess;
  List<Datum>? data;

  MyTeamModel({
    this.isSuccess,
    this.data,
  });

  factory MyTeamModel.fromJson(Map<String, dynamic> json) => MyTeamModel(
        isSuccess: json["isSuccess"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? fplTeamId;
  String? fplName;
  String? userName;
  int? summaryOverallPoints;
  int? summaryOverallRank;
  int? summaryEventRank;
  int? summaryEventPoints;
  List<Pick>? picks;

  Datum({
    this.fplTeamId,
    this.fplName,
    this.userName,
    this.summaryOverallPoints,
    this.summaryOverallRank,
    this.summaryEventRank,
    this.summaryEventPoints,
    this.picks,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fplTeamId: json["fpl_team_id"],
        fplName: json["fpl_name"],
        userName: json["user_name"],
        summaryOverallPoints: json["summary_overall_points"],
        summaryOverallRank: json["summary_overall_rank"],
        summaryEventRank: json["summary_event_rank"],
        summaryEventPoints: json["summary_event_points"],
        picks: List<Pick>.from(json["picks"].map((x) => Pick.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fpl_team_id": fplTeamId,
        "fpl_name": fplName,
        "user_name": userName,
        "summary_overall_points": summaryOverallPoints,
        "summary_overall_rank": summaryOverallRank,
        "summary_event_rank": summaryEventRank,
        "summary_event_points": summaryEventPoints,
        "picks": List<dynamic>.from(picks!.map((x) => x.toJson())),
      };
}

class Pick {
  String? playerId;
  bool? isCaptain;
  bool? isViceCaptain;
  int? position;
  Player? player;

  Pick({
    this.playerId,
    this.isCaptain,
    this.isViceCaptain,
    this.position,
    this.player,
  });

  factory Pick.fromJson(Map<String, dynamic> json) => Pick(
        playerId: json["player_id"],
        isCaptain: json["is_captain"],
        isViceCaptain: json["is_vice_captain"],
        position: json["position"],
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "is_captain": isCaptain,
        "is_vice_captain": isViceCaptain,
        "position": position,
        "player": player!.toJson(),
      };
}
