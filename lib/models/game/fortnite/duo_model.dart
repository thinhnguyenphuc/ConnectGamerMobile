class Duo {
  Duo({
    required this.top3,
    required this.top5,
    required this.top6,
    required this.top10,
    required this.top12,
    required this.top25,
    required this.score,
    required this.scorePerMin,
    required this.scorePerMatch,
    required this.wins,
    required this.kills,
    required this.killsPerMin,
    required this.killsPerMatch,
    required this.deaths,
    required this.kd,
    required this.matches,
    required this.winRate,
    required this.minutesPlayed,
    required this.playersOutlived,
    required this.lastModified,
  });

  final int top5;
  final int top12;
  final int score;
  final double scorePerMin;
  final double scorePerMatch;
  final int wins;
  final int kills;
  final double killsPerMin;
  final double killsPerMatch;
  final int deaths;
  final double kd;
  final int matches;
  final double winRate;
  final int minutesPlayed;
  final int playersOutlived;
  final DateTime lastModified;
  final int top3;
  final int top6;
  final int top10;
  final int top25;

  factory Duo.fromJson(Map<String, dynamic> json) => Duo(
    top3: json["top3"]??-1,
    top5: json["top5"]??-1,
    top6: json["top6"]??-1,
    top10: json["top10"]??-1,
    top12: json["top12"]??-1,
    top25: json["top25"]??-1,
    score: json["score"],
    scorePerMin: json["scorePerMin"].toDouble(),
    scorePerMatch: json["scorePerMatch"].toDouble(),
    wins: json["wins"],
    kills: json["kills"],
    killsPerMin: json["killsPerMin"].toDouble(),
    killsPerMatch: json["killsPerMatch"].toDouble(),
    deaths: json["deaths"],
    kd: json["kd"].toDouble(),
    matches: json["matches"],
    winRate: json["winRate"].toDouble(),
    minutesPlayed: json["minutesPlayed"],
    playersOutlived: json["playersOutlived"],
    lastModified: DateTime.parse(json["lastModified"]),
  );

  Map<String, dynamic> toJson() => {
    "top3": top3,
    "top5": top5,
    "top6": top6,
    "top10": top10,
    "top12": top12,
    "top25": top25,
    "score": score,
    "scorePerMin": scorePerMin,
    "scorePerMatch": scorePerMatch,
    "wins": wins,
    "kills": kills,
    "killsPerMin": killsPerMin,
    "killsPerMatch": killsPerMatch,
    "deaths": deaths,
    "kd": kd,
    "matches": matches,
    "winRate": winRate,
    "minutesPlayed": minutesPlayed,
    "playersOutlived": playersOutlived,
    "lastModified": lastModified.toIso8601String(),
  };
}