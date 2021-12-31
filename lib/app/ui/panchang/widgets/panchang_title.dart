import 'package:flutter/material.dart';
import 'package:india/app/ui/panchang/widgets/panchang_date_selector.dart';
import 'package:india/app/ui/panchang/widgets/sun_and_moon_time.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class PanchangTitle extends StatefulWidget {
  const PanchangTitle({Key? key}) : super(key: key);

  @override
  _PanchangTitleState createState() => _PanchangTitleState();
}

class _PanchangTitleState extends State<PanchangTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              size: 25.toFont,
            ),
            Text(
              kPanchang,
              style: Inter.standardTextInterStyleW600(
                  fontSize: 16.toFont, color: AppColors.black),
            ),
          ],
        ),
        SizedBox(
          height: 5.toHeight,
        ),
        Text(
          kPanchangDetail,
          style: Inter.standardTextInterStyleW400(
              fontSize: 10.toFont, color: AppColors.black),
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        PanchangeDateSelector(),
        SunMoonTime(),
      ],
    );
  }
}
