import 'dart:io';
import 'dart:ui';

import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/routes.dart';
import 'package:connectgamermobile/resources/strings.dart';
import 'package:connectgamermobile/resources/themes.dart';
import 'package:connectgamermobile/widgets/buttons/text_field_button.dart';
import 'package:connectgamermobile/widgets/groups/identifier.dart';
import 'package:connectgamermobile/widgets/icons/icon_with_text.dart';
import 'package:connectgamermobile/widgets/images/circle_image.dart';
import 'package:connectgamermobile/widgets/text_fields/icon_text_field.dart';
import 'package:connectgamermobile/widgets/texts/time_stamp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostsHomePage extends StatefulWidget {
  const PostsHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PostsHomePageState();

}

class PostsHomePageState extends State<PostsHomePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return  Ink(
      color: Theme.of(context).backgroundColor,
      child: const PostList(
        hasCreatePostBtn: true,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class PostList extends StatefulWidget {

  final bool hasCreatePostBtn;

  final EdgeInsets? padding;

  const PostList({Key? key,
    this.hasCreatePostBtn = false,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostListState();
}

class _PostListState extends State<PostList> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.hasCreatePostBtn? ListView.builder(
      padding: widget.padding,
      itemCount: 11,
      itemBuilder: (context, index) {
        return  _createPostItemWithAddPostButton(context, index);
      }
    ): ListView.builder(
      padding: widget.padding,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _createPostItem(context, index);
      }
    );
  }

  Widget _createPostItemWithAddPostButton(BuildContext context, int index) {
    return  index == 0? Padding(
        padding: EdgeInsets.only(bottom: insets.large),
        child: Ink(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.extraLarge),
          child: TextFieldButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.createPost);
            },
            hintText: l10n.createPostBtnText,
          ),
        )): _createPostItem(context, index - 1);
  }

  Widget _createPostItem(BuildContext context, int index) {
    return const Post(
      type: PostType.image,
    );
  }
}

class Post extends StatefulWidget {

  final PostType type;
  final String? text;
  final String? imageUrl;
  final int like;
  final int dislike;

  const Post({Key? key,
    required this.type,
    this.text,
    this.imageUrl,
    this.like = 0,
    this.dislike = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostState();

}

enum PostType {
  image,
  text,
}

class _PostState extends State<Post> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bottomButtons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _CustomTextButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                builder: (context) => buildCommentsBottomSheet(context),
              );
            },
            iconData: Icons.comment,
            text: l10n.commentsBtnText,
          ),
        ),
        Expanded(
          child: _CustomTextButton(
            onPressed: () {},
            iconData: Icons.share,
            text: l10n.shareBtnText,
          ),
        ),
      ],
    );

    return Card(
      shape: const ContinuousRectangleBorder(
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          _PostIdentifier(
            contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            avatarUrl: "assets/images/googleIcon.png",
            name: "User",
            date: DateTime.now(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: createPostBody(),
          ),
          const ReactionRow(),
          const Divider(
            indent: 10,
            endIndent: 10,
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          bottomButtons
        ],
      ),
    );
  }

  Widget createPostBody() {
    switch (widget.type) {
      case PostType.image: {
        return Image.asset(
          "assets/images/placeHolder.png"
        );
      }
      case PostType.text: {
        return Text(widget.text ?? "");
      }
    }
  }

  Widget buildCommentsBottomSheet(BuildContext context) {

    var mediaQuery = MediaQueryData.fromWindow(window);
    var maxHeightPercent = (mediaQuery.size.height - mediaQuery.viewPadding.top) / (mediaQuery.size.height);

    return DraggableScrollableSheet(
      initialChildSize: maxHeightPercent,
      maxChildSize: maxHeightPercent,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          margin: const EdgeInsets.only(top: 4),
          child: Column(
            children: [
              Container(
                child: const ReactionRow(),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )
                  )
                ),
              ),
              const Expanded(
                child: CommentList(),
              ),
              Container(
                margin: MediaQuery.of(context).viewInsets,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade300,
                    )
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: const IconTextField(
                    hintText: "Write a comment",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomTextButton extends StatelessWidget {

  final String text;
  final void Function()? onPressed;
  final TextStyle textStyle;
  final IconData? iconData;

  const _CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textStyle = const TextStyle(
      fontSize: 16,
    ),
    this.iconData,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashFactory: InkRipple.splashFactory,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
  
}

class ReactionRow extends StatefulWidget {
  const ReactionRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReactionRowState();
}

class _ReactionRowState extends State<ReactionRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ignore: prefer_const_constructors
        IconWithText(
            iconSplashRadius: 24,
            icon: const Icon(
              Icons.thumb_up_sharp,
              color: Colors.blue,
            )
        ),
        IconWithText(
            iconSplashRadius: 24,
            icon: Icon(
              Icons.thumb_down_sharp,
              color: Colors.red.shade300,
            )
        )
      ],
    );
  }

}

class CommentList extends StatefulWidget {

  final ScrollController? scrollController;

  const CommentList({Key? key,
    this.scrollController
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentListState();

}

class _CommentListState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemBuilder: (context, index) {
        return const Comment();
      },
    );
  }

}

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentState();
}

class _CommentState extends State<Comment>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          _PostIdentifier(
            avatarUrl: "assets/images/placeHolder.png",
            name: "Name",
            date: DateTime.now(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 4),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Themes.getBubbleColorOf(Theme.of(context)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(Strings.lorem),
              ),
            ),
          )
        ],
      ),
    );
  }
}
///Group of widgets contain: user's avatar, name (and a date)
class _PostIdentifier extends StatelessWidget {

  final String avatarUrl;
  final double avatarSize;
  final void Function()? onAvatarClicked;

  final String name;
  final TextStyle nameTextStyle;

  final DateTime? date;
  final TextStyle dateTextStyle;

  final EdgeInsets contentPadding;

  DateFormat? dateFormat = DateFormat.yMd(Platform.localeName);

  _PostIdentifier({Key? key,
    required this.avatarUrl,
    this.avatarSize = 42,
    this.onAvatarClicked,

    required this.name,
    this.nameTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),

    this.date,
    this.dateTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    this.dateFormat,

    this.contentPadding = EdgeInsets.zero,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: contentPadding,
      child: Identifier(
        title: name,
        titleTextStyle: nameTextStyle,
        avatar: "",
        subtitle: date != null ? TimeStamp(
          dateTime: date!,
          dateFormat: dateFormat,
          textStyle: dateTextStyle,
        ): null,
      ),
    );
  }
}
