import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/chat/response/chat_room_simplify_info_response.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/containers/top_snack_bar_container.dart';
import 'package:connectgamermobile/widgets/groups/chat_room_identifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../models/chat/response/chat_room_full_info_response.dart';

class RoomInfoNotificationSnackBar extends StatelessWidget with StatelessVariablesMixin{
  ChatRoomSimplifyInfoResponse info;
  RoomInfoNotificationSnackBar({Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return TopSnackBarContainer(
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              children: [
                WidgetSpan(
                    child: Padding(
                      child: ThemeBaseGradientContainer(child: Icon(Icons.info_outline)),
                      padding: EdgeInsets.symmetric(horizontal: insets.normal),
                    ),
                    alignment: PlaceholderAlignment.middle
                ),
                TextSpan(
                    children: [
                      ..._buildRoomInfo(info),
                      TextSpan(
                        text: " ${l10n.roomInfoChangeMessage} ",
                        style: theme.textTheme.bodyText2,
                      ),
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }

  List<InlineSpan> _buildRoomInfo(ChatRoomSimplifyInfoResponse info) {
    return [
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: insets.normal),
            child: CircleAvatar(
              foregroundImage: NetworkImage(info.avatar ?? ""),
              radius: 12,
            ),
          )
      ),
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: ThemeBaseGradientContainer(
            child: Text(info.name, style: theme.textTheme.bodyText1,),
          )
      ),
    ];
  }

}