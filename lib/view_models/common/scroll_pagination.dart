import 'package:connectgamermobile/models/commons/pagination.dart';
import 'package:connectgamermobile/models/commons/paging_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class ScrollPaginationViewModel<K, T> extends ChangeNotifier {
  late PagingController<K, T> _pagingController;

  PagingController<K, T> get pagingController {
    return _pagingController;
  }

  late K _currentPageKey;

  int itemPerPage = 20;

  bool _errorDetect = false;

  @mustCallSuper
  ScrollPaginationViewModel() {
    _currentPageKey = getFirstPageKey();

    _initPagination();
  }

  void _initPagination() {
    _pagingController = PagingController(firstPageKey: _currentPageKey);
    _pagingController.addPageRequestListener(_onPageRequested);
  }

  Future<void> _onPageRequested(K page) async {
    List<T>? data = await _getData(page);

    if (!_errorDetect && data != null) {
      data = preProcessData(data);

      if (isLastPageByKey(_currentPageKey) || isLastPageByData(data)) {
        _pagingController.appendLastPage(data);
      } else {
        _pagingController.appendPage(data, getNextPageKey(_currentPageKey, data));
      }
    }
  }

  ///should only fetch data
  ///If you want to change or update something, please use [preProcessData]
  Future<List<T>?> loadNewPage(K pageKey);

  Future<List<T>?> _getData(K pageKey) async {
    _errorDetect = false;
    _currentPageKey = pageKey;

    List<T>? data;

    try {
      data = await loadNewPage(pageKey);
    } catch (e, s) {
      setError("");
    }

    if (data == null) {
      setError("");
      return null;
    }

    return data;
  }

  void refresh() {
    _currentPageKey = getFirstPageKey();
    _pagingController.refresh();
  }

  List<T> preProcessData(List<T> data) {
    return data;
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  K getFirstPageKey();

  ///return false if ignore this
  bool isLastPageByKey(K currentPageKey);

  ///return false if ignore this
  bool isLastPageByData(List<T> data);

  K getNextPageKey(K currentPageKey, List<T> appendedData);

  void setError(String error) {
    _errorDetect = true;
    _pagingController.error = error;
  }

  T? getLastData() {
    List<T>? itemList = pagingController.itemList;
    return itemList != null && itemList.isNotEmpty ? itemList[itemList.length - 1]: null;
  }

  T? getFirstData() {
    List<T>? itemList = pagingController.itemList;
    return itemList != null && itemList.isNotEmpty ? itemList[0]: null;
  }

  T? pickOutLastData() {
    List<T>? itemList = pagingController.itemList;
    return itemList != null && itemList.isNotEmpty ? itemList.removeAt(itemList.length - 1): null;
  }

  T? pickOutFirstData() {
    List<T>? itemList = pagingController.itemList;
    return itemList != null && itemList.isNotEmpty ? itemList.removeAt(0): null;
  }

  ///get n number of data
  ///if n > data length. get all data possible
  List<T> getNLastData(int n) {
    List<T>? itemList = pagingController.itemList;
    if (itemList == null || itemList.isEmpty) {
      return [];
    } else {
      if (n > itemList.length) {
        n = itemList.length;
      }

      return itemList.getRange(itemList.length - n, itemList.length).toList();
    }
  }
}