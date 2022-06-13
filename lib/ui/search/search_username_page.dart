import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/text_field_gradient_app_bar.dart';
import 'package:flutter/material.dart';

class SearchUsernamePage extends StatefulWidget {
  const SearchUsernamePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchUsernamePageState();
}

class _SearchUsernamePageState extends State<SearchUsernamePage> with StateVariablesMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TextFieldGradientAppBar(
        hintText: l10n.searchUsernameHintText,
        data: GradientAppBarData(),
      ).build(context),
      body: const SafeArea(
        child: _SearchUsernameResultList(),
      ),
    );
  }
}

class _SearchUsernameResultList extends StatefulWidget {

  final int count;

  const _SearchUsernameResultList({Key? key,
    this.count = 25,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _SearchUsernameResultListState();

}

class _SearchUsernameResultListState extends State<_SearchUsernameResultList> {

  @override
  Widget build(BuildContext context) {

    var insets =  Insets.of(context);

    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          splashFactory: InkRipple.splashFactory,
          child: Padding(
            padding: EdgeInsets.all(insets.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  foregroundImage: AssetImage(
                    "assets/images/Logo.png",
                  ),
                ),
                SizedBox(width: insets.large,),
                Text(
                  "Name $index",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}