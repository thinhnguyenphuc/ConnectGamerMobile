import 'package:connectgamermobile/ui/commons/scroll_paging_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'empty_data_widget.dart';
import 'error_widget.dart';
import 'loading_page_widget.dart';

class CustomPagedListView<K, T> extends StatelessWidget {
  final PagingController<K, T> pagingController;

  final Widget Function(BuildContext, T item, int index) itemBuilder;

  final Widget Function(BuildContext)? firstPageErrorIndicatorBuilder;
  final Widget Function(BuildContext)? newPageErrorIndicatorBuilder;
  final Widget Function(BuildContext)? noItemsFoundIndicatorBuilder;

  final Function()? onRefresh;

  final ScrollController? scrollController;
  final bool? reverse;

  const CustomPagedListView({Key? key,
    required this.pagingController,
    required this.itemBuilder,
    this.onRefresh,
    this.firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.scrollController,
    this.reverse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<K, T>(
      pagingController: pagingController,
      scrollController: scrollController,
      reverse: reverse ?? false,
      addAutomaticKeepAlives: true,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: firstPageErrorIndicatorBuilder ?? (context) {
          return FetchErrorWidget(
            error: pagingController.error ?? "",
            onRetry: onRefresh ?? pagingController.refresh,
          );
        },
        noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder ?? (context) {
          return FetchEmptyWidget(
          );
        },
        newPageErrorIndicatorBuilder: newPageErrorIndicatorBuilder ??(context) {
          return NewPageErrorIndicator(
            error:pagingController.error ?? "",
            onRetry: pagingController.retryLastFailedRequest,
          );
        },
        firstPageProgressIndicatorBuilder: (context) => const FetchingWidget(),
        newPageProgressIndicatorBuilder: (context) => const NewPageLoadingIndicator(),
      ),
    );
  }

}