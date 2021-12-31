import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class SunMoonMiniWidgets extends StatelessWidget {
  final String? icon;
  final String? time;
  final String? title;
  final bool showPartition;
  SunMoonMiniWidgets(
      {this.time, this.icon, this.showPartition = true, this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.toHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10.toWidth,
          ),
          Container(
            height: 25.toHeight,
            width: 25.toHeight,
            child: Image.asset(
              icon!,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 20.toWidth,
          ),
          Column(
            children: [
              Text(
                title ?? '',
                style: Inter.standardTextInterStyleW400(
                    fontSize: 12.toFont, color: AppColors.primaryBackground),
              ),
              Text(
                '${time != null ? time : kNa}',
                style: Inter.standardTextInterStyleW400(
                    fontSize: 12.toFont, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            width: 10.toWidth,
          ),
          showPartition
              ? Container(
                  width: 1.toHeight,
                  height: 30.toHeight,
                  color: AppColors.primaryBackground,
                )
              : SizedBox.shrink(),
          showPartition
              ? SizedBox(
                  width: 10.toWidth,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
