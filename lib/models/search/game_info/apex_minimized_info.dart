import 'package:connectgamermobile/models/search/game_info/game_minimized_info.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/search/game_info/apex_minimized_info.g.dart';

@JsonSerializable()
class ApexMinimizedInfo extends GameMinimizedInfo {
  String id;
  String inGameName;
  String avatar;
  String level;
  String? rank;
  String? rankDiv;
  String? rankImg;
  String platform;

  ApexMinimizedInfo(this.id, this.inGameName, this.avatar, this.level,
      this.rank, this.rankDiv, this.rankImg, this.platform);

  factory ApexMinimizedInfo.fromJson(Map<String, dynamic> json) => _$ApexMinimizedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ApexMinimizedInfoToJson(this);

  @override
  Widget buildWidget(BuildContext context) {
    var theme = Theme.of(context);
    var insets = Insets.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("IGN: ", style: theme.textTheme.bodyText1,),
                Flexible(
                  child: Text(inGameName, overflow: TextOverflow.clip,),
                )
              ],
            ),
            SizedBox(height: insets.normal,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Level: ", style: theme.textTheme.bodyText1,),
                Flexible(
                  child: Text(level, overflow: TextOverflow.clip,),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 36,
              child: Image.network(rankImg ?? ""),
            ),
            SizedBox(width: insets.small),
            Flexible(
              child: Text("$rank $rankDiv", overflow: TextOverflow.clip,),
            )
          ],
        ),
      ],
    );
  }
}