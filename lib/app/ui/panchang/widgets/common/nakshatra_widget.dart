import 'package:flutter/material.dart';
import 'package:india/app/ui/panchang/model/nakshatra_model.dart';
import 'package:india/app/ui/panchang/widgets/common/tithi_details.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class NakshatraWidget extends StatefulWidget {
  const NakshatraWidget({Key? key}) : super(key: key);

  @override
  _NakshatraWidgetState createState() => _NakshatraWidgetState();
}

class _NakshatraWidgetState extends State<NakshatraWidget> {
  NakshatraModel? nakshatraModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kNakshatra,
          style: Inter.standardTextInterStyleW700(
              fontSize: 16.toFont, color: AppColors.black),
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kNakshatraNumber,
          information: nakshatraModel?.nakshatraNumber,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kNakshatraName,
          information: nakshatraModel?.nakshatraName,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kRuler,
          information:
              nakshatraModel?.ruler,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kDeity,
          information: nakshatraModel?.deity,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
        TithiDetails(
          title: kSummary,
          information: nakshatraModel?.summary,
        ),
        SizedBox(
          height: 10.toHeight,
        ),
      ],
    );
  }
}
