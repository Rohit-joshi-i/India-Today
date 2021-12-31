import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';

class PanchangSelectorCommon extends StatefulWidget {
  final String? title;
  final Widget? endIcon;
  final Function? onTap;
  final String? subTitle;
  PanchangSelectorCommon({this.onTap, this.title, this.endIcon, this.subTitle});
  @override
  _PanchangSelectorCommonState createState() => _PanchangSelectorCommonState();
}

class _PanchangSelectorCommonState extends State<PanchangSelectorCommon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap!(context);
      },
      child: Container(
        width: 200.toWidth,
        height: 40.toHeight,
        color: AppColors.white,
        padding: AppDimensions.horizontal8,
        child: Center(
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.subTitle ?? ''),
          widget.endIcon ?? SizedBox.shrink()
        ])),
      ),
    );
  }
}
