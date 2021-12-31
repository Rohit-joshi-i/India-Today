import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:india/app/repository/model/astrologer_agent_details_model.dart';
import 'package:india/app/ui/common/common_button.dart';
import 'package:india/app/ui/talk_to_astrologer/widgets/card_details.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';

class AstrologerCard extends StatefulWidget {
  final AgentData? agent;
  AstrologerCard({this.agent});
  @override
  _AstrologerCardState createState() => _AstrologerCardState();
}

class _AstrologerCardState extends State<AstrologerCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// Profile Pic
            ///
            Container(
              width: 100.toWidth,
              child: CachedNetworkImage(
                imageUrl: widget.agent?.images?.large?.imageUrl ?? '',
                imageBuilder: (context, imgHolder) {
                  return Container(
                    height: 100.toHeight,
                    width: 100.toHeight,
                    decoration:
                        BoxDecoration(image: DecorationImage(image: imgHolder)),
                  );
                },
                errorWidget: (context, value, _) {
                  //Dummy Image in case we don't get URL
                  return Container(
                    height: 100.toHeight,
                    width: 100.toHeight,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'))),
                  );
                },
              ),
            ),
            CardDetails(
              lastName: widget.agent?.lastName ?? '',
              firstName: widget.agent?.firstName ?? '',
              information: _getLanguageDetails(),
              callRate: _getCallsRate(),
              experience: _getExperience(),
              experienceInYears: widget.agent?.experience,
            ),
          ],
        ),
        CommonButton(),
        SizedBox(
          height: 15.toHeight,
        ),
        Container(
          width: 375.toWidth,
          height: 1.toHeight,
          color: AppColors.primaryColor,
        )
      ],
    );
  }

  String _getLanguageDetails() {
    var languageInformation = '';
    for (int i = 0; i < widget.agent!.languages!.length; i++) {
      if (i == widget.agent!.languages!.length - 1) {
        languageInformation =
            languageInformation + '${widget.agent!.languages![i].name!} ';
      } else {
        languageInformation =
            languageInformation + '${widget.agent!.languages![i].name!}, ';
      }
    }
    return languageInformation;
  }

  String _getExperience() {
    var details = '';
    for (int i = 0; i < widget.agent!.skills!.length; i++) {
      if (i == widget.agent!.skills!.length - 1) {
        details = details + '${widget.agent!.skills![i].name!} ';
      } else {
        details = details + '${widget.agent!.skills![i].name!}, ';
      }
    }
    return details;
  }

  String _getCallsRate() {
    return '₹${widget.agent!.additionalPerMinuteCharges!.toStringAsFixed(0)}/ ${kMin}';
  }
}
