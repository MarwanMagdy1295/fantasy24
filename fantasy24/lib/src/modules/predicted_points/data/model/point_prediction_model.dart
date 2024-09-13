// To parse this JSON data, do
//
//     final pointPredictionModel = pointPredictionModelFromJson(jsonString);

import 'dart:convert';

PointPredictionModel pointPredictionModelFromJson(String str) =>
    PointPredictionModel.fromJson(json.decode(str));

String pointPredictionModelToJson(PointPredictionModel data) =>
    json.encode(data.toJson());

class PointPredictionModel {
  List<PredictionPointData>? predictionPointList;
  bool? isSuccess;
  int? totalCount;
  int? currentPage;
  int? pageSize;
  int? totalPages;

  PointPredictionModel({
    this.predictionPointList,
    this.isSuccess,
    this.totalCount,
    this.currentPage,
    this.pageSize,
    this.totalPages,
  });

  factory PointPredictionModel.fromJson(Map<String, dynamic> json) =>
      PointPredictionModel(
        predictionPointList: List<PredictionPointData>.from(
            json["data"].map((x) => PredictionPointData.fromJson(x))),
        isSuccess: json["isSuccess"],
        totalCount: json["totalCount"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(predictionPointList!.map((x) => x.toJson())),
        "isSuccess": isSuccess,
        "totalCount": totalCount,
        "currentPage": currentPage,
        "pageSize": pageSize,
        "totalPages": totalPages,
      };
}

class PredictionPointData {
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

  PredictionPointData({
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

  factory PredictionPointData.fromJson(Map<String, dynamic> json) =>
      PredictionPointData(
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

class PlayerPrediction {
  String? id;
  double? predictedPoints;
  String? eventId;
  Event? event;

  PlayerPrediction({
    this.id,
    this.predictedPoints,
    this.eventId,
    this.event,
  });

  factory PlayerPrediction.fromJson(Map<String, dynamic> json) =>
      PlayerPrediction(
        id: json["id"],
        predictedPoints: double.parse(json["predicted_points"].toString()),
        eventId: json["event_id"],
        event: Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "predicted_points": predictedPoints,
        "event_id": eventId,
        "event": event!.toJson(),
      };
}

class Event {
  String? id;
  String? name;
  DateTime? deadlineTime;
  List<Fixture>? fixtures;

  Event({
    this.id,
    this.name,
    this.deadlineTime,
    this.fixtures,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        deadlineTime: DateTime.parse(json["deadline_time"]),
        fixtures: List<Fixture>.from(
            json["fixtures"].map((x) => Fixture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deadline_time": deadlineTime!.toIso8601String(),
        "fixtures": List<dynamic>.from(fixtures!.map((x) => x.toJson())),
      };
}

class Fixture {
  String? id;
  DateTime? kickoffTime;
  String? homeTeamId;
  String? awayTeamId;
  int? homeTeamDifficulty;
  int? awayTeamDifficulty;
  Team? homeTeam;
  Team? awayTeam;

  Fixture({
    this.id,
    this.kickoffTime,
    this.homeTeamId,
    this.awayTeamId,
    this.homeTeamDifficulty,
    this.awayTeamDifficulty,
    this.homeTeam,
    this.awayTeam,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        kickoffTime: DateTime.parse(json["kickoff_time"]),
        homeTeamId: json["home_team_id"],
        awayTeamId: json["away_team_id"],
        homeTeamDifficulty: json["home_team_difficulty"],
        awayTeamDifficulty: json["away_team_difficulty"],
        homeTeam: Team.fromJson(json["home_team"]),
        awayTeam: Team.fromJson(json["away_team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kickoff_time": kickoffTime!.toIso8601String(),
        "home_team_id": homeTeamId,
        "away_team_id": awayTeamId,
        "home_team_difficulty": homeTeamDifficulty,
        "away_team_difficulty": awayTeamDifficulty,
        "home_team": homeTeam!.toJson(),
        "away_team": awayTeam!.toJson(),
      };
}

class Team {
  String? id;
  String? name;
  String? shortName;

  Team({
    this.id,
    this.name,
    this.shortName,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
      };
}
