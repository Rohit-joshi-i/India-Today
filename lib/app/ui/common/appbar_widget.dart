import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';
///
/// Common AppBar
///
AppBar getAppBar(BuildContext context){
  return AppBar(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.white,
    elevation: 0,
    leadingWidth: 30.toWidth,
    leading: Container(
        padding: AppDimensions.left10,
        height: 30.toHeight,
        width: 30.toHeight,
        child: Image.asset(
          AppIcons.select,
          fit: BoxFit.contain,
        )),
    centerTitle: true,
    title: SizedBox(
        height: 50.toHeight,
        width: 50.toHeight,
        child: Image.asset(
          AppIcons.heading,
          fit: BoxFit.contain,
        )),
    actions: [
      Container(
          height: 50.toHeight,
          width: 50.toHeight,
          padding: AppDimensions.right10,
          child: Image.asset(
            AppIcons.profile,
            fit: BoxFit.contain,
          ))
    ],
  );
}
