import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/widgets/images/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoubleCircleImage extends StatelessWidget {

  final String? firstAvatar;
  final String? secondAvatar;

  final double size;

  const DoubleCircleImage({
    Key? key,
    this.firstAvatar,
    this.secondAvatar,
    this.size = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: _createAvatar(firstAvatar),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _createAvatar(secondAvatar),
          )
        ],
      ),
    );
  }

  Widget _createAvatar(String? url) {
    return UserAvatar(
      avatar: url,
      //(size / 2) * 2/3
      radius: size / 3,
    );
  }

}