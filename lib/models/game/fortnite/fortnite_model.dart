import 'dart:convert';

import 'package:connectgamermobile/models/game/fortnite/duo_model.dart';

FortniteProfile fortniteProfileFromJson(String str) => FortniteProfile.fromJson(json.decode(str));

String fortniteProfileToJson(FortniteProfile data) => json.encode(data.toJson());

class FortniteProfile {
  FortniteProfile({
    required this.accountId,
    required this.name,
    required this.image,
    required this.stats,
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
  });

  final String accountId;
  final String name;
  final String image;
  final Stats stats;
  final String id;
  final DateTime createdAt;
  final DateTime modifiedAt;

  factory FortniteProfile.fromJson(Map<String, dynamic> json) => FortniteProfile(
    accountId: json["acccountID"],
    name: json["name"],
    image: json["image"],
    stats: Stats.fromJson(json["stats"]),
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "acccountID": accountId,
    "name": name,
    "image": image,
    "stats": stats.toJson(),
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
  };
}

class Stats {
  Stats({
    required this.overall,
    required this.solo,
    required this.duo,
    required this.squad,
    required this.ltm,
  });

  final Duo overall;
  final Duo solo;
  final Duo duo;
  final Duo squad;
  final Duo ltm;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    overall: Duo.fromJson(json["overall"]),
    solo: Duo.fromJson(json["solo"]),
    duo: Duo.fromJson(json["duo"]),
    squad: Duo.fromJson(json["squad"]),
    ltm : Duo.fromJson(json["ltm"]),
  );

  Map<String, dynamic> toJson() => {
    "overall": overall.toJson(),
    "solo": solo.toJson(),
    "duo": duo.toJson(),
    "squad": squad.toJson(),
    "ltm": ltm.toJson(),
  };
}
