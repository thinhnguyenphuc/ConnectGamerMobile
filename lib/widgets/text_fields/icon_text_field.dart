import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final TextStyle style;
  final bool textObscured;
  final EdgeInsetsGeometry iconPadding;
  final EdgeInsetsGeometry contentPadding;
  final IconData? iconData;
  final double iconSize;
  final Color iconColor;
  ///True if icon is a prefix icon, Else it's a suffix icon
  final bool iconIsPrefix;
  final EdgeInsetsGeometry prefixIconPadding;
  final void Function()? onIconClicked;
  final String hintText;
  final double borderRadius;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool passField;
  final IconButton? hidePassButton;
  final Function(String)? onSubmitted;
  ///Create an rounded border input field with a prefix icon
  ///
  const IconTextField({Key? key,
    this.style = const TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
    this.textObscured = false,
    this.iconPadding = EdgeInsets.zero,
    this.prefixIconPadding = const EdgeInsets.only( top: 10, left: 0, right: 0, bottom: 10),
    this.contentPadding = const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    this.iconData,
    this.hintText = "",
    this.borderRadius = 32.0,
    this.iconSize = 24,
    this.iconColor = Colors.black,
    this.iconIsPrefix = true,
    this.onIconClicked,
    this.textEditingController,
    this.focusNode,
    this.autoFocus = false,
    this.passField = false,
    this.hidePassButton,
    this.onSubmitted,
  }):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoratePass = InputDecoration(
        prefixIcon: Padding(
          padding: prefixIconPadding,
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
        suffixIcon: hidePassButton,
        contentPadding: contentPadding,
        hintText: hintText,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)));

    final decorate = InputDecoration(
        prefixIcon: iconIsPrefix && iconData != null? createIcon(): null,
        contentPadding: contentPadding,
        hintText: hintText,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)));

    return TextField(
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      autofocus: autoFocus,
      controller: textEditingController,
      obscureText: textObscured,
      style: style,
      decoration: passField?decoratePass:decorate,
      onSubmitted: onSubmitted,
    );
  }

  Widget createIcon() {
    return IconButton(
      padding: iconPadding,
      icon: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
      onPressed: onIconClicked,
    );
  }
}
