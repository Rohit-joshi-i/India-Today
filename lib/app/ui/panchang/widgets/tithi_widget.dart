import 'package:flutter/material.dart';
import 'package:india/app/ui/panchang/model/tithi_model.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

import 'common/tithi_details.dart';

class TithiWidget extends StatefulWidget {
  const TithiWidget({Key? key}) : super(key: key);

  @override
  _TithiWidgetState createState() => _TithiWidgetState();
}

class _TithiWidgetState extends State<TithiWidget> {
  TithiModel? tithiModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kTithiName,
          style: Inter.standardTextInterStyleW700(
              fontSize: 16.toFont, color: AppColors.black),
        ),
        TithiDetails(
          title: kTithiNumber,
          information: tithiModel?.tithiNumber,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kTithiName,
          information: tithiModel?.tithiName,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(title: kSpecial, information: tithiModel?.special),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kSummary,
          information: tithiModel?.summary,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kDeity,
          information: tithiModel?.deity,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kEndTime,
          information: tithiModel?.endTime,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
      ],
    );
  }
}
