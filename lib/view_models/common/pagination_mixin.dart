import 'package:connectgamermobile/widgets/pagination/small_pagination.dart';

///Used to control [PaginationController] logic inside view model;
mixin PaginationViewModelMixin {

  ///Please remember to call [initPaginationController] and dispose it after by [disposePaginationController]
  late PaginationController _paginationController;

  int itemPerPage = 20;

  PaginationController? get paginationController => _paginationController;

  int get currentPage => _paginationController.currentPage.value;

  set currentPage(int value) {
    _paginationController.currentPage.value = value;
  }

  int get totalPage => _paginationController.maxPage.value;

  set totalPage(int value) {
    _paginationController.maxPage.value = value;
  }

  void onPageChanged();

  bool validate(int page) {
    return page == _paginationController.currentPage.value;
  }

  void initPaginationController() {
    _paginationController = PaginationController();
    _paginationController.currentPage.addListener(onPageChanged);
  }

  void disposePaginationController() {
    _paginationController.dispose();
  }

  void resetPagination() {
    _paginationController.currentPage.removeListener(onPageChanged);
    _paginationController.currentPage.value = 1;
    _paginationController.maxPage.value = 1;
    _paginationController.currentPage.addListener(onPageChanged);
  }
}