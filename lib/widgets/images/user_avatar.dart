import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/strings.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  final String? avatar;
  const UserAvatar({Key? key,
    this.radius = 24,
    this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: avatar != null ? NetworkImage(avatar!): AssetImage(AssetPaths.defaultPersonAvatar) as ImageProvider,
      radius: radius,
    );
  }

}