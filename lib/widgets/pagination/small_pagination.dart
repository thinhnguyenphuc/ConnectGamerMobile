
import 'package:flutter/material.dart';

class PaginationController  {

  late ValueNotifier<int> maxPage;
  late ValueNotifier<int> currentPage;

  Function()? onPageOutOfBounds;

  ValueNotifier<bool> disabled = ValueNotifier(false);

  PaginationController({
    int maxPage = 1,
    int currentPage = 1
  }) {
    this.maxPage = ValueNotifier(maxPage);
    this.currentPage = ValueNotifier(currentPage);
  }

  void nextPage() {
    jumpTo(currentPage.value + 1);
  }

  void previousPage() {
    jumpTo(currentPage.value - 1);
  }

  void jumpTo(int pageIndex) {
    if (!disabled.value) {
      if (pageIndex > 0 && pageIndex <= maxPage.value) {
        currentPage.value = pageIndex;
      } else {
        onPageOutOfBounds?.call();
      }
    }
  }

  void dispose() {
    currentPage.dispose();
    maxPage.dispose();
    disabled.dispose();
  }

  void disable() {
    disabled.value = true;
  }

  void enable() {
    disabled.value = false;
  }
}

class SmallPaginationWidget extends StatefulWidget {
  final PaginationController pageController;

  const SmallPaginationWidget({Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmallPaginationWidgetState();

}

class SmallPaginationWidgetState extends State<SmallPaginationWidget> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    widget.pageController.currentPage.addListener(onPageIndexChanged);

    _focusNode = FocusNode();

    _textEditingController = TextEditingController();
    setPageNumber();
    super.initState();
  }

  void setPageNumber() {
    _textEditingController.value = TextEditingValue(text: (widget.pageController.currentPage.value).toString());
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    widget.pageController.currentPage.removeListener(onPageIndexChanged);

    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onPageIndexChanged() {
    setState(() {
      setPageNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.pageController.maxPage.value > 0 ? _buildWidget(context): const SizedBox.shrink();
  }

  Widget _buildWidget(BuildContext context) {

    var iconSize = 24.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.pageController.currentPage.value > 1) SizedBox.square(
          dimension: iconSize,
          child: IconButton(
            splashRadius: iconSize,
            padding: EdgeInsets.zero,
            onPressed: widget.pageController.disabled.value? null: () {
              widget.pageController.previousPage();
            },
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
        ) else SizedBox.square(dimension: iconSize),
        SizedBox(
          width: 40,
          child: Align(
            alignment: Alignment.center,
            child:  TextField(
              focusNode: _focusNode,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.red,
              ),
              readOnly: (widget.pageController.maxPage.value <= 1),
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              controller: _textEditingController,
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                widget.pageController.jumpTo((int.tryParse(text) ?? 1));
              },
            ),
          ),
        ),
        if (widget.pageController.maxPage.value != 0) Text("/ ${widget.pageController.maxPage.value.toString()}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        if (widget.pageController.maxPage.value != 0 && widget.pageController.currentPage.value < widget.pageController.maxPage.value) SizedBox.square(
          dimension: iconSize,
          child: IconButton(
            splashRadius: iconSize,
            padding: EdgeInsets.zero,
            onPressed: widget.pageController.disabled.value? null: () {
              widget.pageController.nextPage();
            },
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
        ) else SizedBox.square(dimension: iconSize),
      ],
    );
  }

}