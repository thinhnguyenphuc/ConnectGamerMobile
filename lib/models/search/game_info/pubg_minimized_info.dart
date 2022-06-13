import 'package:connectgamermobile/models/search/game_info/game_minimized_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/search/game_info/pubg_minimized_info.g.dart';

@JsonSerializable()
class PubgMinimizedInfo extends GameMinimizedInfo {
  String id;
  String inGameName;
  String avatar;
  String level;
  String? rank;
  String platform;

  PubgMinimizedInfo(this.id, this.inGameName, this.avatar, this.level,
      this.rank, this.platform);

  factory PubgMinimizedInfo.fromJson(Map<String, dynamic> json) => _$PubgMinimizedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PubgMinimizedInfoToJson(this);

  @override
  Widget buildWidget(BuildContext context) {
    return const Text("");
  }

}