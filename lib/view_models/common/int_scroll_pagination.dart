import 'package:connectgamermobile/view_models/common/scroll_pagination.dart';
import 'package:flutter/foundation.dart';

import '../../models/commons/paging_response.dart';

abstract class IntScrollPaginationViewModel<T> extends ScrollPaginationViewModel<int, T> {

  int _totalPage = 1;

  @nonVirtual
  @override
  int getFirstPageKey() {
    return 1;
  }

  @nonVirtual
  @override
  bool isLastPageByKey(int currentPageKey) {
    return currentPageKey >= _totalPage;
  }

  @nonVirtual
  @override
  Future<List<T>?> loadNewPage(int pageKey) async {
    var response = await fetchResponse(pageKey);

    if (response != null) {
      _totalPage = response.pagination.totalPage;
      return response.data;
    }

    return null;
  }

  Future<PagingResponse<T>?> fetchResponse(int pageKey);

  @nonVirtual
  @override
  int getNextPageKey(int currentPageKey, List<T> appendedData) {
    return currentPageKey + 1;
  }

  @nonVirtual
  @override
  bool isLastPageByData(List<T> data) {
    return false;
  }

  @mustCallSuper
  @override
  void refresh() {
    super.refresh();
    _totalPage = 1;
  }
}