import 'package:flutter/material.dart';

import '../app_colours.dart';
import 'app_fonts.dart';

class Inter {
  Inter._();
  static TextStyle standardTextInterStyle({
    required double fontSize,
    required String fontFamily,
    Color color = AppColors.primaryTitle,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        height: lineHeight,
        fontFamily: fontFamily,
        letterSpacing: 1.0,
      );
  static TextStyle standardTextInterStyleW200(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w200,
        fontFamily: AppFonts.inter,
        height: lineHeight,
        fontSize: fontSize,
        letterSpacing: 1.0,
      );
  static TextStyle standardTextInterStyleW300(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextInterStyleW400(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextInterStyleW500(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextInterStyleW600(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextInterStyleW700(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );
  static TextStyle standardTextInterStyleW900(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
        fontFamily: AppFonts.inter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );
}
