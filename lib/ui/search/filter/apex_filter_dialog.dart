import 'package:connectgamermobile/models/search/filter/game_filter.dart';
import 'package:connectgamermobile/resources/games/ranks/apex.dart';
import 'package:connectgamermobile/ui/search/filter/search_filter_dialog.dart';
import 'package:connectgamermobile/view_models/search_view_model.dart';
import 'package:connectgamermobile/widgets/groups/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ApexFilterDialog extends SearchFilterDialog {

  final MultiSelectTagController _multiSelectTagController = MultiSelectTagController();

  ApexFilterDialog({Key? key}) : super(key: key);

  @override
  List<SearchFilterGroup> createFilterGroups(BuildContext context) {
    ApexGameFilter filter = Provider.of<SearchViewModel>(context, listen: false).gameFilter as ApexGameFilter;
    return [
      SearchFilterGroup(
        items: [
          SearchFilterGroupItem(
            title: l10n.rankTitle,
            content: MultiSelectFilterTagGroup(
              tagsName: ApexRanks.strings,
              initialValues: filter.ranks,
              controller: _multiSelectTagController,
            ),
          )
        ],
      ),
    ];
  }

  @override
  GameFilter createFilterData() {
    return ApexGameFilter(_multiSelectTagController.values);
  }

}