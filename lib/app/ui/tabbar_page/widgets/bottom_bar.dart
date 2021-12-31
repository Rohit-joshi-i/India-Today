import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';

class BottomBar extends StatefulWidget {
  final Function? onTap;
  final int? index;
  const BottomBar({this.onTap, this.index, Key? key}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.toWidth,
      height: 60.toHeight,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.primaryColor.withOpacity(.2),
            blurRadius: 2.toWidth,
            spreadRadius: 2.toWidth)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                widget.onTap!(0);
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: widget.index == 0
                        ? [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColors.primaryColor.withOpacity(.5),
                          blurRadius: 3.toWidth,
                          spreadRadius: 4.toWidth)
                          ]
                        : [],
                  ),
                  height: 30.toHeight,
                  width: 30.toHeight,
                  child: Image.asset(AppIcons.home))),
          GestureDetector(
              onTap: () {
                widget.onTap!(1);
              },
              child: Container(
                height: 30.toHeight,
                width: 30.toHeight,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: widget.index == 1
                        ? [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColors.primaryColor.withOpacity(.5),
                          blurRadius: 3.toWidth,
                          spreadRadius: 4.toWidth)
                          ]
                        : []),
                child: Image.asset(AppIcons.chat),
              )),
          GestureDetector(
              onTap: () {
                widget.onTap!(2);
              },
              child: Container(
                height: 30.toHeight,
                width: 30.toHeight,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: widget.index == 2
                        ? [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColors.primaryColor.withOpacity(.5),
                          blurRadius: 3.toWidth,
                          spreadRadius: 4.toWidth)
                          ]
                        : []),
                child: Image.asset(AppIcons.question),
              )),
          GestureDetector(
              onTap: () {
                widget.onTap!(3);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: widget.index == 3
                          ? [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: AppColors.primaryColor.withOpacity(.5),
                            blurRadius: 3.toWidth,
                            spreadRadius: 4.toWidth)
                            ]
                          : []),
                  height: 30.toHeight,
                  width: 30.toHeight,
                  child: Image.asset(AppIcons.space))),
          GestureDetector(
              onTap: () {
                widget.onTap!(4);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: widget.index == 4
                        ? [
                            BoxShadow(
                                offset: Offset(0, 0),
                                color: AppColors.primaryColor.withOpacity(.5),
                                blurRadius: 3.toWidth,
                                spreadRadius: 4.toWidth)
                          ]
                        : []),
                height: 30.toHeight,
                width: 30.toHeight,
                child: Icon(
                  Icons.chat,
                  size: 30.toHeight,
                  color: AppColors.black.withOpacity(.3),
                ),
              )),
        ],
      ),
    );
  }
}
