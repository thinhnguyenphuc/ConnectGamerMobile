import 'package:connectgamermobile/data/repositories/search_repository.dart';
import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:connectgamermobile/models/search/filter/filter_search_request.dart';
import 'package:connectgamermobile/models/search/filter/game_filter.dart';
import 'package:connectgamermobile/models/search/filter/user_filter.dart';
import 'package:connectgamermobile/models/search/user_search_response.dart';
import 'package:connectgamermobile/resources/enums.dart';
import 'package:connectgamermobile/view_models/common/base_view_model.dart';

import 'common/pagination_mixin.dart';

class SearchViewModel extends BaseViewModel with PaginationViewModelMixin {

  ///Must be called to initialize [_searchRepository]
  init(SupportedGame game) {
    initPaginationController();
    _searchRepository = SearchRepository(game);
    gameFilter = GameFilterFactory.createDefaultFrom(game);
    _initSearch();
  }

  late GameFilter gameFilter;

  UserFilter _userFilter = UserFilter.createDefault();

  late SearchRepository _searchRepository;

  List<UserSearchResponse>? data;

  String userNameFilter = "";

  void applyGameFilter(GameFilter filter) {
    gameFilter = filter;
    resetPagination();
    _search();
  }

  void applyUserFilter(UserFilter filter) {
    _userFilter = filter;
    resetPagination();
    _search();
  }

  void applyUserNameFilter(String userName) {
    _userFilter.name = userName;
    resetPagination();
    _search();
  }

  void _initSearch() {
    _sendAndHandleResponse();
  }

  void _sendAndHandleResponse() async {
    var response = await _searchRepository.search(
        SearchRequest(gameFilter, _userFilter, PaginationRequest(currentPage, itemPerPage)));
    handleResponse(response);
  }

  void _search() {
    clearData();
    setLoading();
    _sendAndHandleResponse();
  }

  void handleResponse(PagingResponse<UserSearchResponse> response) {
    errorMessage = response.error;
    setDoneLoading(response.success());

    if (response.success() && validate(response.pagination.currentPage)) {
      totalPage = response.pagination.totalPage;
      data = response.data;
    }
  }

  void clearData() {
    data = null;
  }

  @override
  void dispose() {
    super.dispose();
    paginationController?.dispose();
  }

  @override
  void onPageChanged() {
    _search();
  }
}