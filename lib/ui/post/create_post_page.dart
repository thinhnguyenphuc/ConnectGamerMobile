import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePostPage();

}

class _CreatePostPage extends State<CreatePostPage> with StateVariablesMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: GradientAppBar(
        data: GradientAppBarData(
          title: Text(l10n.createPostTitle),
        )
      ).build(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: insets.large, vertical: insets.small),
        child: Column(
          children: [
            TextField(
              maxLines: null,
              style: theme.textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: l10n.createPostHintText,
                  border: InputBorder.none
              ),
            )
          ],
        ),
      ),
    );
  }

}