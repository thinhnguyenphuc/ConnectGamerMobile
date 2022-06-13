import 'package:connectgamermobile/widgets/containers/gradient_container.dart';

import '../../custom_classes/mixins/base_widget_mixins.dart';
import '../../models/user/user_minimized_info.dart';
import 'package:flutter/material.dart';

import '../controllers/multi_select_controller.dart';

class MultiSelectContainer extends StatelessWidget with StatelessVariablesMixin {

  UserMinimizedInfo data;
  MultiSelectController controller;
  int index;
  Widget content;
  bool selectDisabled;
  Function()? onTap;

  MultiSelectContainer({Key? key,
    required this.data,
    required this.controller,
    required this.index,
    required this.content,
    this.selectDisabled = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: controller.isSelecting
          ? () {
        controller.onTap(data);
      } : onTap,
      onLongPress: !controller.isSelecting && !selectDisabled ? () {
        controller.startSelect(data);
      }: null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: insets.large, horizontal: insets.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            content,
            if (controller.isSelecting && !selectDisabled ) Ink(
              height: 24,
              width: 24,
              child: controller.isSelected(data) ? const ThemeBaseGradientContainer(
                  child: Icon(Icons.check_box)
              ): const ThemeBaseGradientContainer(
                child: Icon(Icons.check_box_outline_blank)
              ),
            )
          ],
        ),
      ),
    );
  }
}