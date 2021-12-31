import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/app_dimensions.dart';
import 'package:india/resources/fonts/inter.dart';

class TithiDetails extends StatelessWidget {
  final String? title;
  final String? information;
  TithiDetails({this.information, this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${title!}:',
          style: Inter.standardTextInterStyleW600(
              fontSize: 12.toFont, color: AppColors.black.withOpacity(.4)),
        ),
        Container(
            width: 220.toWidth,
            padding: AppDimensions.horizontal16,
            child: Text('${information != null ? information : kNa}',
                style: Inter.standardTextInterStyleW600(
                    fontSize: 12.toFont,
                    color: AppColors.black.withOpacity(.4)))),
      ],
    );
  }
}
