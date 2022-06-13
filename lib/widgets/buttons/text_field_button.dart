import 'package:flutter/material.dart';

///Button that looks like an input field
class TextFieldButton extends StatelessWidget {

  final String? hintText;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;

  final void Function()? onPressed;

  const TextFieldButton({Key? key,
    this.hintText,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 100,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: contentPadding,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        child: hintText != null ? Text(hintText!,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
            color: Colors.grey,
          ),
        ): null,
      ),
    );
  }

}
