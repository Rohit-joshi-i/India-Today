import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/app_dimensions.dart';

import 'common/moon_sun_mini_widget.dart';

class SunMoonTime extends StatefulWidget {
  const SunMoonTime({Key? key}) : super(key: key);

  @override
  _SunMoonTimeState createState() => _SunMoonTimeState();
}

class _SunMoonTimeState extends State<SunMoonTime> {
  String? sunRise;
  String? sunSet;
  String? moonRise;
  String? moonSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.toWidth,
      height: 60.toHeight,
      margin: AppDimensions.horizontal4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -1.toHeight),
              color: AppColors.grey,
              blurRadius: 1.toHeight,
              spreadRadius: 1.toHeight,
              blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.toHeight),
            bottomLeft: Radius.circular(10.toHeight)),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SunMoonMiniWidgets(
            icon: AppIcons.sunRise,
            time: sunRise,
            title: kSunrise,
          ),
          SunMoonMiniWidgets(
            icon: AppIcons.sunSet,
            time: sunSet,
            title: kSunset,
          ),
          SunMoonMiniWidgets(
            icon: AppIcons.moonRise,
            time: moonRise,
            title: kMoonrise,
          ),
          SunMoonMiniWidgets(
            icon: AppIcons.moonSet,
            time: moonSet,
            title: kMoonset,
            showPartition: false,
          ),
        ],
      ),
    );
  }
}
