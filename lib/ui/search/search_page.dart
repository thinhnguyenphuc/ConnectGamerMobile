import 'package:connectgamermobile/custom_classes/extensions/navigator_extension.dart';
import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/models/search/user_search_response.dart';
import 'package:connectgamermobile/resources/enums.dart';
import 'package:connectgamermobile/ui/commons/empty_data_widget.dart';
import 'package:connectgamermobile/ui/commons/error_widget.dart';
import 'package:connectgamermobile/ui/commons/loading_page_widget.dart';
import 'package:connectgamermobile/ui/search/filter/filter_factory.dart';
import 'package:connectgamermobile/view_models/search_view_model.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/bars/text_field_gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/expandable_container.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:connectgamermobile/widgets/pagination/small_pagination.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/common/fetch_state.dart';

class SearchPage extends StatefulWidget {
  final SupportedGame game;
  const SearchPage({Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with StateVariablesMixin {

  final TextEditingController _searchTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    initViewModel();

    final debouncer = Debouncer<String>(const Duration(milliseconds: 300), initialValue: _searchTEC.text);
    _searchTEC.addListener(() {
      debouncer.value = _searchTEC.text;
    });
    debouncer.values.listen((search)  {
      Provider.of<SearchViewModel>(context, listen: false).applyUserNameFilter(search);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initViewModel() {
    var viewModel = Provider.of<SearchViewModel>(context, listen: false);
    viewModel.init(widget.game);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TextFieldGradientAppBar(
        data: GradientAppBarData(actions: [
          SmallPaginationWidget(pageController: Provider.of<SearchViewModel>(context).paginationController ?? PaginationController()),
          IconButton(
            icon: const Icon(Icons.filter_alt,),
            onPressed: () => onFilterClicked(context),
          )
        ]
        ),
        hintText: l10n.searchUsernameHintText,
        textEditingController: _searchTEC,
        enabled: Provider.of<SearchViewModel>(context).state != FetchState.loading
      ).build(context),
      body: const SearchResultList(),
    );
  }

  void onFilterClicked(BuildContext context) {
    var viewModel = Provider.of<SearchViewModel>(context, listen: false);

    showDialog(
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(
            value: viewModel,
            child: FilterDialogFactory.buildFilterDialog(widget.game),
          );
        }
    );
  }
}

class SearchResultList extends StatefulWidget {

  const SearchResultList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);
    switch (viewModel.state) {
      case FetchState.success: {
        if (dataIsEmpty(viewModel.data)) {
          return FetchEmptyWidget();
        } else {
          return ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: viewModel.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return SearchResultItem(
                key: Key(viewModel.data![index].userInfo.toString()),
                data: viewModel.data![index],
              );
            },
          );
        }
      }
      case FetchState.loading:
        return const FetchingWidget();
      case FetchState.error:
        return FetchErrorWidget(error: viewModel.errorMessage,);
    }
  }

  bool dataIsEmpty(List<UserSearchResponse>? data) {
    if (data == null || data.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

class SearchResultItem extends StatefulWidget {
  final UserSearchResponse data;
  const SearchResultItem({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> with AutomaticKeepAliveClientMixin, StateVariablesMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.primaryColor),
        borderRadius: BorderRadius.circular(insets.normal),
      ),
      child: ExpandableContainer(
        expandedChild: createCollapsibleContent(context),
        staticChild: createStaticContent(context),
      ),
    );
  }

  Widget createStaticContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(insets.large),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigatorExtension.navigateToAccountPage(context);
                        },
                        child: widget.data.userInfo.avatar!=null ? CircleAvatar(
                          radius: 24,
                          foregroundImage: NetworkImage(widget.data.userInfo.avatar!),
                        ):Image.asset("assets/images/userIconWhite.png"),
                      ),
                      SizedBox(width: insets.large),
                      Flexible(
                        child: Text(
                          widget.data.userInfo.userName,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.subtitle1,
                        ),
                      )
                    ],
                  )
              ),
              ThemeBaseGradientContainer(
                  child: IconButton(
                    icon: const Icon(Icons.person_add_alt_1),
                    onPressed: () {},
                  ),
              ),
            ],
          ),
          ThemeBaseGradientContainer(
            child: Divider(
              height: insets.extraLarge,
              thickness: 1,
            ),
          ),
          widget.data.gameInfo.buildWidget(context)
        ],
      ),
    );
  }

  Widget createCollapsibleContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: insets.large, right: insets.large, bottom: insets.large),
      child: Column(
        children: [
          const ThemeBaseGradientContainer(
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
          SizedBox(height: insets.large,),
          Text(
            widget.data.userInfo.bio??"Unknown",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
