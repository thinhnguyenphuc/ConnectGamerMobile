
import 'package:flutter/material.dart';

class TagGroup extends StatelessWidget {
  final List<String> tagsName;

  final double tagSpacing;
  final double linesSpacing;

  final EdgeInsets itemPadding;

  const TagGroup({Key? key,
    required this.tagsName,
    this.tagSpacing = 4,
    this.linesSpacing = 4,
    this.itemPadding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: tagSpacing,
      runSpacing: linesSpacing,
      children: [
        for (var name in tagsName) Tag(name: name, padding: itemPadding),
      ],
    );
  }
}

class FilterTagGroup extends StatefulWidget {
  final List<String> tagsName;

  final double tagSpacing;
  final double linesSpacing;

  final EdgeInsets itemPadding;

  final String? firstChosenTagName;

  final void Function(String)? onTagTap;

  const FilterTagGroup({Key? key,
    required this.tagsName,
    this.tagSpacing = 4,
    this.linesSpacing = 4,
    this.itemPadding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    this.firstChosenTagName,
    this.onTagTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterTagGroupState();

}

class FilterTagGroupState extends State<FilterTagGroup> {

  String? _currentTagName;

  @override
  void initState() {
    _currentTagName = widget.firstChosenTagName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.tagSpacing,
      runSpacing: widget.linesSpacing,
      children: createTags(context),
    );
  }

  List<Widget> createTags(BuildContext context) {
    List<Widget> tagList = List<Widget>.empty(growable: true);

    for (var name in widget.tagsName) {
      if (name == _currentTagName) {
        tagList.add(Tag(
          name: name,
          padding: widget.itemPadding,
          onTap: onTap,
          tagColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).primaryTextTheme.bodyText1?.color,
        ));
      } else {
        tagList.add(Tag(
          name: name,
          padding: widget.itemPadding,
          onTap: onTap,
          tagColor: Colors.grey.shade300,
          textColor: Colors.grey,
        ));
      }
    }

    return tagList;
  }

  void onTap(String name) {
    widget.onTagTap?.call(name);
    if (_currentTagName != name) {
      setState(() {
        _currentTagName = name;
      });
    }
  }
}

class MultiSelectFilterTagGroup extends StatefulWidget {
  final List<String> tagsName;

  final double tagSpacing;
  final double linesSpacing;

  final EdgeInsets itemPadding;

  final List<String>? initialValues;

  final MultiSelectTagController? controller;

  const MultiSelectFilterTagGroup({Key? key,
    required this.tagsName,
    this.tagSpacing = 4,
    this.linesSpacing = 4,
    this.itemPadding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    this.initialValues,
    this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectFilterTagGroupState();

}

class _MultiSelectFilterTagGroupState extends State<MultiSelectFilterTagGroup> {

  late MultiSelectTagController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? MultiSelectTagController(startValues: widget.initialValues);
    _controller.values = widget.initialValues;
    _controller.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.tagSpacing,
      runSpacing: widget.linesSpacing,
      children: createTags(context),
    );
  }

  List<Widget> createTags(BuildContext context) {
    List<Widget> tagList = List<Widget>.empty(growable: true);

    for (var name in widget.tagsName) {
      if (_controller.values.contains(name)) {
        tagList.add(Tag(
          name: name,
          padding: widget.itemPadding,
          onTap: onTap,
          tagColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).primaryTextTheme.bodyText1?.color,
        ));
      } else {
        tagList.add(Tag(
          name: name,
          padding: widget.itemPadding,
          onTap: onTap,
          tagColor: Colors.grey.shade300,
          textColor: Colors.grey,
        ));
      }
    }

    return tagList;
  }

  void onTap(String name) {
    _controller._tagChosen(name);
  }
}

class Tag extends StatelessWidget {

  final String name;

  final EdgeInsets padding;

  final Color? tagColor;
  final Color? textColor;

  final void Function(String)? onTap;

  const Tag({Key? key,
    required this.name,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),

    this.tagColor,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(name);
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: tagColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          name,
          style: TextStyle(
              fontSize: Theme.of(context).primaryTextTheme.bodyText2?.fontSize,
              color: textColor ?? Theme.of(context).primaryTextTheme.bodyText2?.color
          ),
        ),
      ),
    );
  }
}

class MultiSelectTagController extends ChangeNotifier {

  late List<String> _values;

  List<String> get values {
    return _values;
  }

  set values(List<String>? newValues) {
    if (newValues == null) {
      return;
    }
    if (newValues == _values) {
      return;
    } else {
      _values = newValues;
      notifyListeners();
    }
  }

  MultiSelectTagController({
    List<String>? startValues,
  }) {
    _values =  [];
    _values.addAll(startValues ?? []);
  }

  void _tagChosen(String chosenValue) {
    if (_values.contains(chosenValue)) {
      _values.remove(chosenValue);
    } else {
      _values.add(chosenValue);
    }
    notifyListeners();
  }
}