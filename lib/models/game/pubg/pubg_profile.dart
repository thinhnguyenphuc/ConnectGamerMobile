import 'dart:convert';

import 'package:connectgamermobile/models/game/pubg/duo_model.dart';

PUBGProfile PUBGProfileFromJson(String str) => PUBGProfile.fromJson(json.decode(str));

String PUBGProfileToJson(PUBGProfile data) => json.encode(data.toJson());

class PUBGProfile {
  PUBGProfile({
    required this.name,
    required this.accountId,
    required this.gameModeStats,
    required this.bestRankPoint,
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
  });

  final String name;
  final String accountId;
  final GameModeStats gameModeStats;
  final int bestRankPoint;
  final String id;
  final DateTime createdAt;
  final DateTime modifiedAt;

  factory PUBGProfile.fromJson(Map<String, dynamic> json) => PUBGProfile(
    name: json["name"],
    accountId: json["accountID"],
    gameModeStats: GameModeStats.fromJson(json["gameModeStats"]),
    bestRankPoint: json["bestRankPoint"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "accountID": accountId,
    "gameModeStats": gameModeStats.toJson(),
    "bestRankPoint": bestRankPoint,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
  };
}

class GameModeStats {
  GameModeStats({
    required this.duo,
    required this.duoFpp,
    required this.solo,
    required this.soloFpp,
    required this.squad,
    required this.squadFpp,
  });

  final Duo duo;
  final Duo duoFpp;
  final Duo solo;
  final Duo soloFpp;
  final Duo squad;
  final Duo squadFpp;

  factory GameModeStats.fromJson(Map<String, dynamic> json) => GameModeStats(
    duo: Duo.fromJson(json["duo"]),
    duoFpp: Duo.fromJson(json["duoFpp"]),
    solo: Duo.fromJson(json["solo"]),
    soloFpp: Duo.fromJson(json["soloFpp"]),
    squad: Duo.fromJson(json["squad"]),
    squadFpp: Duo.fromJson(json["squadFpp"]),
  );

  Map<String, dynamic> toJson() => {
    "duo": duo.toJson(),
    "duoFpp": duoFpp.toJson(),
    "solo": solo.toJson(),
    "soloFpp": soloFpp.toJson(),
    "squad": squad.toJson(),
    "squadFpp": squadFpp.toJson(),
  };
}
