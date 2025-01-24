import 'package:flutter/material.dart';
import 'package:swigato/core/common/widgets/widget_fuction_combine.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class CustomAppbar extends StatelessWidget {
  final WidgetFuctionCombine? firstWidget;
  final WidgetFuctionCombine? secWidget;
  final WidgetFuctionCombine? thirdWidget;
  final WidgetFuctionCombine? fourthWidget;
  const CustomAppbar({
    super.key,
    this.firstWidget,
    this.secWidget,
    this.thirdWidget,
    this.fourthWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (firstWidget != null) firstWidget!.widget,
              if (secWidget != null) secWidget!.widget,
            ],
          ),
          Row(
            children: [
              if (thirdWidget != null) thirdWidget!.widget,
              if (fourthWidget != null) fourthWidget!.widget,
            ],
          )
        ],
      ),
    );
  }
}
