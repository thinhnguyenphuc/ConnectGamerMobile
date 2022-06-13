import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/view_models/common/fetch_state.dart';
import 'package:connectgamermobile/view_models/search_view_model.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../../models/search/filter/game_filter.dart';


abstract class SearchFilterDialog extends StatelessWidget with StatelessVariablesMixin {

  SearchFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final state = Provider.of<SearchViewModel>(context).state;

    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      splashRadius: 24,
                    ),
                    SizedBox(
                      width: insets.large,
                    ),
                    ThemeBaseGradientContainer(
                      child: Text(
                        l10n.filterTitle,
                        style: TextStyle(
                            fontSize: theme.textTheme.headline5?.fontSize,
                            fontWeight: theme.textTheme.headline5?.fontWeight,
                            color: theme.primaryColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (state == FetchState.loading) const ThemeBaseGradientContainer(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: LoadingIndicator(
                          indicatorType: Indicator.circleStrokeSpin,
                        ),
                      ),
                    ),
                    ThemeBaseGradientContainer(
                        child: IconButton(
                          onPressed: state == FetchState.loading? null: () async {
                            await _onApply(context, createFilterData());
                          },
                          icon: const Icon(
                            Icons.save,
                          ),
                          splashRadius: 24,
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(child: createContent(context)),
            ),
          )
        ],
      ),
    );
  }

  Widget createContent(BuildContext context) {
    var divider = Divider(
      thickness: 1,
      color: Colors.grey.shade300,
      indent: insets.extraLarge,
      endIndent: insets.extraLarge,
      height: insets.extraLarge * 2,
    );

    var groups = createFilterGroups(context);

    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(insets.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(groups.length*2 - 1, (index) {
              if (index.isEven) {
                return groups[index~/2];
              } else {
                return divider;
              }
            }),
          ),
        )
    );
  }

  List<SearchFilterGroup> createFilterGroups(BuildContext context);

  GameFilter createFilterData();

  Future<void> _onApply(BuildContext context, GameFilter filter) async {
    Provider.of<SearchViewModel>(context, listen: false).applyGameFilter(filter);
    Navigator.pop(context);
  }
}

class SearchFilterGroup extends StatelessWidget with StatelessVariablesMixin {
  final String? title;
  final List<SearchFilterGroupItem> items;

  SearchFilterGroup({
    Key? key,
    this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.headline6,
            ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(items.length * 2 - 1, (index) {
                if (index.isEven) {
                  return items[index ~/ 2];
                } else {
                  return SizedBox(
                    height: insets.large,
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}

class SearchFilterGroupItem extends StatelessWidget
    with StatelessVariablesMixin {
  final String? title;
  final Widget content;

  SearchFilterGroupItem({
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        SizedBox(
          height: insets.normal,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: insets.large),
          child: content,
        )
      ],
    );
  }
}
