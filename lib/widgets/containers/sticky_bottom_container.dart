import 'package:flutter/cupertino.dart';

class StickyBottomContainer extends StatelessWidget {
  final Widget? child;
  const StickyBottomContainer({Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: child,
    );
  }

}