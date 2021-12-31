import 'package:flutter/material.dart';

import '../app_colours.dart';
import 'app_fonts.dart';

class Pushter {
  Pushter._();
  static TextStyle standardTextPushterStyle({
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
  static TextStyle standardTextPushterStyleW200(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w200,
        fontFamily: AppFonts.pushter,
        height: lineHeight,
        fontSize: fontSize,
        letterSpacing: 1.0,
      );
  static TextStyle standardTextPushterStyleW300(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextPushterStyleW400(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextPushterStyleW500(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 1.0,
      );

  static TextStyle standardTextPushterStyleW600(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );

  static TextStyle standardTextPushterStyleW700(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );
  static TextStyle standardTextPushterStyleW900(
      {required double fontSize,
        Color color = AppColors.primaryTitle,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
        fontFamily: AppFonts.pushter,
        fontSize: fontSize,
        letterSpacing: 1.0,
        height: lineHeight,
      );
}
