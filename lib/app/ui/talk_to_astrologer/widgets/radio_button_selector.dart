import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';
import 'package:india/resources/fonts/inter.dart';

class RadioButtonSelector extends StatefulWidget {
  final String? title;
  final bool? selected;//If true highlight the radio button
  RadioButtonSelector({this.title,this.selected = false});
  @override
  _RadioButtonSelectorState createState() => _RadioButtonSelectorState();
}

class _RadioButtonSelectorState extends State<RadioButtonSelector> {
  @override
  Widget build(BuildContext context) {
    ///
    /// Select radio button
    ///
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20.toHeight,
          width: 20.toHeight,
          padding: AppDimensions.all10,
          decoration: BoxDecoration(
            color: widget.selected! ? AppColors.primaryColor.withOpacity(.5): AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.black.withOpacity(.5))),

        ),
        SizedBox(
          width: 20.toWidth,
        ),
        Text(
          widget.title ?? '',
          style: Inter.standardTextInterStyleW600(
              fontSize: 14.toFont, color: AppColors.black),
        )
      ],
    );
  }
}
