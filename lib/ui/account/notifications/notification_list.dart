import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/friend/response/friend_request_response.dart';
import 'package:connectgamermobile/widgets/buttons/gradient_button.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/groups/identifier.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

enum NotificationType {
  friendRequest,
}

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Text("123");
      },
    );
  }
}

class FriendRequestNotificationItem extends StatelessWidget
    with StatelessVariablesMixin {
  FriendRequestResponse data;

  void Function()? onAccept;
  void Function()? onDecline;

  bool isLoading;

  FriendRequestNotificationItem({
    Key? key,
    required this.data,
    this.onAccept,
    this.onDecline,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: insets.large, vertical: insets.large),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        child: Ink(
          color: theme.cardColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: insets.extraLarge, vertical: insets.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Identifier(title: data.requesterName, avatar: null),
                    SizedBox(
                      height: insets.large,
                    ),
                    Text(l10n.otherFriendRequestText)
                  ],
                ),
                isLoading
                    ? const SizedBox(
                        height: 48,
                        width: 48,
                        child: ThemeBaseGradientContainer(
                          child: LoadingIndicator(
                            indicatorType: Indicator.circleStrokeSpin,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          GradientButton(
                            child: Text(
                              l10n.acceptBtnText,
                            ),
                            borderRadius: BorderRadius.circular(insets.large),
                            onPressed: onAccept,
                          ),
                          GradientButton(
                            child: Text(
                              l10n.declineBtnText,
                              style: theme.textTheme.bodyText2,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                theme.backgroundColor,
                                theme.backgroundColor
                              ],
                            ),
                            borderRadius: BorderRadius.circular(insets.large),
                            onPressed: onDecline,
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
