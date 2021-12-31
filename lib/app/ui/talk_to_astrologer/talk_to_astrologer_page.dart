import 'package:flutter/material.dart';
import 'package:india/app/ui/common/appbar_widget.dart';
import 'package:india/app/ui/talk_to_astrologer/widgets/talk_to_astrologer_results.dart';
import 'package:india/app/ui/talk_to_astrologer/widgets/talk_to_astrologer_title.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';

class TalkToAstrologerPage extends StatefulWidget {
  const TalkToAstrologerPage({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerPageState createState() => _TalkToAstrologerPageState();
}

class _TalkToAstrologerPageState extends State<TalkToAstrologerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: getAppBar(context),
      body: Padding(
        padding: AppDimensions.horizontal16,
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();

          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///
                /// Astrologer title
                ///
                TalkToAstrologerTitle(),
                SizedBox(height: 10.toHeight,),
                TalkToAstrologerResults()],
            ),
          ),
        ),
      ),
    );
  }
}
