import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/resources/nums.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/text_field_gradient_app_bar.dart';
import 'package:flutter/material.dart';

class SearchChatPage extends StatefulWidget {
  const SearchChatPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchChatPageState();
}

class _SearchChatPageState extends State<SearchChatPage> with StateVariablesMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TextFieldGradientAppBar(
        hintText: l10n.searchHintText,
        data: GradientAppBarData(),
      ).build(context),
      body: const SafeArea(
        child: SearchChatResultList(),
      ),
    );
  }
}

class SearchChatResultList extends StatefulWidget {

  final int count;

  const SearchChatResultList({Key? key,
    this.count = 25,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _SearchChatResultListState();

}

class _SearchChatResultListState extends State<SearchChatResultList> {

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