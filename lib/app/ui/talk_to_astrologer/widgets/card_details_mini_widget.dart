import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/fonts/inter.dart';

class CardDetailsMiniWidget extends StatelessWidget {
  final IconData? title;
  final String? details;
  final bool? isBold;
  const CardDetailsMiniWidget({this.title, this.details, this.isBold = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    /// Show details tile
    ///
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 20.toHeight,
            width: 20.toHeight,
            child: Icon(title,color: AppColors.primaryColor,size: 15.toFont,)),
        Spacer(),
        Container(
          width: 220.toWidth,
          child: Text(
            details ?? '',
            style: !isBold!
                ? Inter.standardTextInterStyleW400(fontSize: 12.toFont,color: AppColors.black)
                : Inter.standardTextInterStyleW700(fontSize: 12.toFont,color: AppColors.black),
          ),
        )
      ],
    );
  }
}
