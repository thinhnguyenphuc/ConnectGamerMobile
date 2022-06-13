import 'package:connectgamermobile/utils/color.dart';
import 'package:flutter/material.dart';

import 'icon_text_field.dart';

class ChatTextField extends StatefulWidget {
  final void Function(String)? onSend;

  const ChatTextField({Key? key,
    this.onSend
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatTextFieldState();

}

class _ChatTextFieldState extends State<ChatTextField> {
  final FocusNode _focusNode = FocusNode();

  bool _focused = false;

  final TextEditingController _TEC = TextEditingController();
  @override
  void initState() {
    _focusNode.addListener(_onInputFieldFocusChanged);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onInputFieldFocusChanged);
    _focusNode.dispose();
    _TEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var emojiIconButton = GradientUtils.paintWidget(context, IconButton(
      icon: Icon(
        Icons.tag_faces,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {},
    ));

    var inputField = Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: IconTextField(
            textEditingController: _TEC,
            focusNode: _focusNode,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            onSubmitted: _send,
          ),
        )
    );

    var sendIconButton = GradientUtils.paintWidget(context, IconButton(
      icon: Icon(
        Icons.send,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        _send(_TEC.text);
      },
    ));

    List<Widget> inputFieldRowChildren = [
      emojiIconButton,
      inputField,
      sendIconButton
    ];

    return Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.grey)
            )
        ),
        child: Row(
          children: inputFieldRowChildren,
        )
    );
  }

  void _onInputFieldFocusChanged() {
    if (_focusNode.hasFocus) {
      _textFieldFocused();
    } else if (!_focusNode.hasFocus) {
      _textFieldUnfocused();
    }
  }

  void _textFieldUnfocused() {
    setState(() {
      _focused = false;
    });
  }

  void _textFieldFocused() {
    setState(() {
      _focused = true;
    });
  }

  void _send(String message) {
    widget.onSend?.call(message);
    _TEC.text = "";
  }

}