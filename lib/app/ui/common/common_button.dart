import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({Key? key}) : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.toHeight,
      child: Container(
        height: 40.toHeight,
        width: 120.toWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.toHeight),
            color: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.call_outlined,
              color: AppColors.white,
            ),
            Text(
              kOnCall,
              style: Inter.standardTextInterStyleW300(
                  fontSize: 12.toFont, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
