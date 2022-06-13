class Duo {
  Duo({
    required this.wins,
    required this.loses,
    required this.winRate,
    required this.top10Rate,
    required this.kills,
    required this.headshotKills,
    required this.headshotRate,
    required this.longestKill,
    required this.top10S,
    required this.rankPoints,
    required this.rankPointsTitle,
  });

  final int wins;
  final int loses;
  final dynamic winRate;
  final double top10Rate;
  final int kills;
  final int headshotKills;
  final double headshotRate;
  final double longestKill;
  final int top10S;
  final int rankPoints;
  final String rankPointsTitle;

  factory Duo.fromJson(Map<String, dynamic> json) => Duo(
    wins: json["wins"],
    loses: json["loses"],
    winRate: json["winRate"],
    top10Rate: json["top10Rate"].toDouble(),
    kills: json["kills"],
    headshotKills: json["headshotKills"],
    headshotRate: json["headshotRate"].toDouble(),
    longestKill: json["longestKill"].toDouble(),
    top10S: json["top10s"],
    rankPoints: json["rankPoints"],
    rankPointsTitle: json["rankPointsTitle"],
  );

  Map<String, dynamic> toJson() => {
    "wins": wins,
    "loses": loses,
    "winRate": winRate,
    "top10Rate": top10Rate,
    "kills": kills,
    "headshotKills": headshotKills,
    "headshotRate": headshotRate,
    "longestKill": longestKill,
    "top10s": top10S,
    "rankPoints": rankPoints,
    "rankPointsTitle": rankPointsTitle,
  };
}