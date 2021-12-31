import 'package:flutter/material.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

import 'card_details_mini_widget.dart';

class CardDetails extends StatefulWidget {
  final String? information;
  final String? experience;
  final String? callRate;
  final String? firstName;
  final String? lastName;
  final double? experienceInYears;
  CardDetails(
      {this.information,
      this.callRate,
      this.experience,
      this.lastName,
      this.firstName,
      this.experienceInYears});
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245.toWidth,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 178.toWidth,
                child: Text(
                  '${widget.firstName} ${widget.lastName}',
                  style: Inter.standardTextInterStyleW600(
                      fontSize: 16.toFont, color: AppColors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Text(
                '${widget.experienceInYears!.toStringAsFixed(0)} ${kYears}',
                style: Inter.standardTextInterStyleW400(
                    fontSize: 15.toFont,
                    color: AppColors.black.withOpacity(.5)),
              )
            ],
          ),
          SizedBox(
            height: 10.toHeight,
          ),
          widget.information!.isNotEmpty
              ? CardDetailsMiniWidget(
            title: Icons.language,
                  details: widget.information,
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 5.toHeight,
          ),
          widget.experience!.isNotEmpty
              ? CardDetailsMiniWidget(
            title: Icons.info_outlined,
                  details: widget.experience ?? '',
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 5.toHeight,
          ),
          CardDetailsMiniWidget(
            title: Icons.money,
            details: widget.callRate,
            isBold: true,
          ),
          SizedBox(
            height: 10.toHeight,
          ),
        ],
      ),
    );
  }
}
