import 'package:connectgamermobile/custom_classes/mixins/base_widget_mixins.dart';
import 'package:connectgamermobile/widgets/bars/gradient_app_bar.dart';
import 'package:connectgamermobile/widgets/containers/gradient_container.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';

///Should be used in home pages if [alwaysShowSearch] == false (default behaviour)
class SearchGradientAppBar extends StatefulWidget {
  
  final GradientAppBarData appBarData;
  final String? hintText;
  final ValueNotifier<bool>? enabled;
  final Function(String)? onSearch;
  final bool alwaysShowSearch;
  
  const SearchGradientAppBar({
    Key? key,
    required this.appBarData,
    this.hintText,
    this.enabled,
    this.onSearch,
    this.alwaysShowSearch = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchGradientAppBar();
}

class _SearchGradientAppBar extends State<SearchGradientAppBar> with StateVariablesMixin {
  
  late final Widget? title;

  late bool shouldShowSearch = widget.alwaysShowSearch;

  late FocusNode _focusNode;

  final TextEditingController _searchTEC = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    title = widget.appBarData.title;

    final debouncer = Debouncer<String>(const Duration(milliseconds: 300), initialValue: _searchTEC.text);
    _searchTEC.addListener(() {
      debouncer.value = _searchTEC.text;
    });
    debouncer.values.listen((search)  {
      widget.onSearch?.call(search);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();

    _searchTEC.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    prepareAppBarData(context);

    return GradientAppBar(
      data: widget.appBarData,
      titleIsGradient: !shouldShowSearch,
    ).build(context);
  }

  void prepareAppBarData(BuildContext context) {
    if (widget.alwaysShowSearch) {
      widget.appBarData.title = _buildTextField(context);
      return;
    }

    if (shouldShowSearch) {
      widget.appBarData.noLeading = true;
      widget.appBarData.title = _buildTextField(context);
      _focusNode.requestFocus();
    } else {
      widget.appBarData.noLeading = false;
      widget.appBarData.leading = ThemeBaseGradientContainer(
        child: IconButton(
          onPressed: () {
            setState(() {
              shouldShowSearch = true;
            });
          },
          icon: const Icon(Icons.search),
        ),
      );
      widget.appBarData.title = title;
    }
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: _searchTEC,
      enabled: widget.enabled?.value,
      focusNode: _focusNode,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontWeight: theme.textTheme.bodyText2?.fontWeight,
            fontSize: theme.textTheme.bodyText2?.fontSize,
            color: theme.hintColor,
          ),
          suffixIcon: widget.alwaysShowSearch? null: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                shouldShowSearch = false;
              });
              _searchTEC.text = "";
              widget.onSearch?.call("");
            },
          )
      ),
    );
  }
}