import 'dart:convert';

ApexProfile apexProfileFromJson(String str) => ApexProfile.fromJson(json.decode(str));

String apexProfileToJson(ApexProfile data) => json.encode(data.toJson());

class ApexProfile {
  ApexProfile({
    required this.id,
    required this.name,
    required this.level,
    required this.avatar,
    required this.platform,
    required this.bans,
    required this.rank,
    required this.arena,
    required this.kills,
    required this.damage,
    required this.headshots,
  });

  final String id;
  final String name;
  final int level;
  final String avatar;
  final String platform;
  final Bans bans;
  final Arena rank;
  final Arena arena;
  final int kills;
  final int damage;
  final int headshots;

  factory ApexProfile.fromJson(Map<String, dynamic> json) => ApexProfile(
    id: json["id"],
    name: json["name"],
    level: json["level"],
    avatar: json["avatar"],
    platform: json["platform"],
    bans: Bans.fromJson(json["bans"]),
    rank: Arena.fromJson(json["rank"]),
    arena: Arena.fromJson(json["arena"]),
    kills: json["kills"]??0,
    damage: json["damage"]??0,
    headshots: json["headshots"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "level": level,
    "avatar": avatar,
    "platform": platform,
    "bans": bans.toJson(),
    "rank": rank.toJson(),
    "arena": arena.toJson(),
    "kills": kills,
    "damage": damage,
    "headshots": headshots,
  };
}

class Arena {
  Arena({
    required this.rankScore,
    required this.rankName,
    required this.rankDiv,
    required this.ladderPosPlatform,
    required this.rankImg,
    required this.rankedSeason,
    required this.rankPos,
    required this.topPercent,
  });

  final int rankScore;
  final String rankName;
  final int rankDiv;
  final int ladderPosPlatform;
  final String rankImg;
  final String rankedSeason;
  final dynamic rankPos;
  final dynamic topPercent;

  factory Arena.fromJson(Map<String, dynamic> json) => Arena(
    rankScore: json["rankScore"],
    rankName: json["rankName"],
    rankDiv: json["rankDiv"],
    ladderPosPlatform: json["ladderPosPlatform"],
    rankImg: json["rankImg"],
    rankedSeason: json["rankedSeason"],
    rankPos: json["rankPos"],
    topPercent: json["topPercent"],
  );

  Map<String, dynamic> toJson() => {
    "rankScore": rankScore,
    "rankName": rankName,
    "rankDiv": rankDiv,
    "ladderPosPlatform": ladderPosPlatform,
    "rankImg": rankImg,
    "rankedSeason": rankedSeason,
    "rankPos": rankPos,
    "topPercent": topPercent,
  };
}

class Bans {
  Bans({
    required this.isActive,
    required this.remainingSeconds,
    required this.lastBanReason,
  });

  final bool isActive;
  final int remainingSeconds;
  final String lastBanReason;

  factory Bans.fromJson(Map<String, dynamic> json) => Bans(
    isActive: json["isActive"],
    remainingSeconds: json["remainingSeconds"],
    lastBanReason: json["last_banReason"],
  );

  Map<String, dynamic> toJson() => {
    "isActive": isActive,
    "remainingSeconds": remainingSeconds,
    "last_banReason": lastBanReason,
  };
}
